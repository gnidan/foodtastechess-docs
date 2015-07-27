System Architecture
===================

Overview
--------

**foodtastechess** is architected as a client-server system, built around
a command/query-separated request system.

It comprises a server application designed for the Go programming language, a
thin browser client to use the React Javascript framework, and two
database systems: a MySQL server and a MongoDB instance.


Physical Components
-------------------

- A long-running server process (*main application*)
- A collection of MySQL tables used as an append-only log (*events DB*)
- A documents database (MongoDB) used as a cache for event aggregation (*game state
  cache*)
- A front-end web application that runs in the browser and makes
  HTTP requests to the *main application*. (*client application*)

.. uml::
    :scale: 70 %

    [Client Application] ..> HTTP
    HTTP - [Main Application]
    node "MySQL Server" {
        database UsersDB
        database EventsDB
    }

    node "MongoDB" {
        database GameStateCache
    }

    [Main Application] ..> UsersDB
    [Main Application] ..> EventsDB
    [Main Application] ..> GameStateCache

System Operations
`````````````````

Physical components will be managed using Docker containers. Third-party cloud
services will be used to host and run the containers. Containers will be used
to facilitate process management and dependencies, requiring minimal overhead
for deployment.

Main Application Architecture
-----------------------------

The main application separates command logic from query logic by
using event-sourced representations of data (games.)
Games are stored canonically as a series of events, but provide
the abstraction of aggregation over these events. Aggregation
is cached for performance reasons.

The purpose of this separation is to three-fold: (1) maintain records of
domain actions, as opposed to simply storing domain objects in their most
current state, (2) it allows for data updates to sidestep many concurrency
problems by having a single event log as the system-wide canonical
representation of domain objects, and (3) to allow for good system performance
by keeping cached aggregates and reducing the need for a client application
to wait for command results.

.. uml::
    interface HTTP

    package "Server" {
        HTTP - [Server]
    }

    package "Client Query Service" {
        interface "Client Query Interface" as ClientQueryInterface
        component [Client Query Service] as ClientQueryService
        ClientQueryService -up- ClientQueryInterface
    }

    package "Client Command Service" {
        interface "Command Interface" as CommandInterface
        interface "Command Validation" as CommandValidation
        component [Command Service] as CommandService
        component [Validation Service] as ValidationService

        CommandService - CommandInterface
        CommandService ..> CommandValidation : validates with
        CommandValidation - ValidationService
    }

    package "Users and Authentication" {
        interface "Users Interface" as UsersInterface
        interface "Authentication Interface" as AuthenticationInterface
        component [Users Service] as UsersService

        UsersService -left- UsersInterface
        UsersService -up- AuthenticationInterface
    }

    package "Events" {
        interface "Event Interface" as EventInterface
        interface "Event Subscriber Interface" as EventSubscriberInterface
        interface "Game Event Lock Interface" as GameEventLockInterface
        component [Event Service] as EventService

        EventService -up- EventInterface
        EventService -up- GameEventLockInterface
        EventService .right.> EventSubscriberInterface : notifies
    }

    package "System Query Service" {
        interface "System Query Interface" as SystemQueryInterface
        component [System Query Service] as SystemQueryService
        component [Query Buffer] as QueryBuffer

        SystemQueryService -up- SystemQueryInterface
        SystemQueryService -down- QueryBuffer

        package "Game Logic" {
            interface "Game State Interface" as GameStateInterface
            component [Game State] as GameState

            GameState -up- GameStateInterface
        }

        SystemQueryService .right.> GameStateInterface
    }

    [Server] ..> CommandInterface : submits (**POST**)
    [Server] ..> ClientQueryInterface : submits (**GET**)
    [Server] .right.> AuthenticationInterface : authenticates with

    database UsersDB
    UsersService - UsersDB

    ClientQueryService ..> UsersInterface : includes results from
    ClientQueryService ..> SystemQueryInterface : exposes facade of

    ValidationService .right.> ClientQueryInterface : checks state against
    CommandService ..> EventInterface : sends events to
    CommandService ..> GameEventLockInterface : acquires and releases locks with

    database EventsDB
    EventService - EventsDB

    database GameStateCache
    QueryBuffer - EventSubscriberInterface
    SystemQueryService -down- GameStateCache
    SystemQueryService ..> EventInterface : retrieves events from

