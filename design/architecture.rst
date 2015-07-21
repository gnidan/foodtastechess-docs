System Architecture
===================

Overview
--------

**foodtastechess** is architected as a web service, comprising several
physical components, most centrally of which is a server application.
This main application uses a model of *Command-Query Responsibility
Separation*, and is roughly divided into three discrete layers.


Physical Components
```````````````````

- A long-running server process (*main application*)
- A relational database used as an append-only log (*events DB**)
- A documents database used as a cache for event aggregation (*game state
  cache*)
- A front-end web application that runs in the browser and makes
  HTTP requests to the *main application*. (*client application*)


CQRS
````

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


Application Layers
``````````````````

HTTP layer
    Responsible for interpreting HTTP requests and
    marshalling responses. It forwards the interpreted
    requests to the Request layer and returns the results
    as formatted HTTP responses.

Request layer
    Handles commands, queries, and authentication logic.
    It is responsible for validating commands, and communicates
    with the Event and Aggregation layer by issuing events and
    retrieving state.  It is also responsible for augmenting aggregate
    state results with user profile information.

Event and Aggregation layer
    Manages storage and aggregation of events. It provides two
    interfaces to the Request layer: one for accepting new events
    and one for returning aggregate state information.


Component Diagrams
------------------

Physical Components
```````````````````

.. uml::
    :scale: 70 %

    [Client Application] ..> HTTP
    HTTP - [Main Application]
    database UsersDB
    database EventsDB
    database GameStateCache
    [Main Application] ..> UsersDB
    [Main Application] ..> EventsDB
    [Main Application] ..> GameStateCache

Main Application Architecture
`````````````````````````````

.. uml::
    interface HTTP

    package "Server" {
        HTTP - [Server]
    }
    package "Commands" {
        interface "Command Validation" as CommandValidation
        interface "Command Processing" as CommandProcessing
        component [Commands Service] as CommandService

        CommandProcessing -left- CommandService
        CommandService ..> CommandValidation : validates with
        CommandValidation - [Validation]
    }
    [Server] ..> CommandProcessing : POSTs to

    package "Queries" {
        interface "Query Processing" as QueryProcessing
        component [Query Service] as QueryService
        QueryProcessing - QueryService
    }
    [Server] ..> QueryProcessing : GETs from

    package "Authentication" {
        interface User
        component "Users Service" as UserService
        User - UserService
    }
    [Server] ..> User : authenticates with

    database UsersDB
    UserService - UsersDB

    QueryService .right.> User : includes

    package "Games Management" {
        interface "Event Aggregation" as EventAggregation
        interface "Event Source" as EventSource
        interface "Event" as Event
        interface "Game State" as GameState
        interface "Game Event Lock" as GameLock

        Event -down- [Events]
        GameLock -down- [Events]
        EventSource -up- [Events]

        GameState -down- [Aggregation]
        EventAggregation -up- [Aggregation]

        [Events]
        [Aggregation]
        [Events] ..> EventAggregation : notifies on new events
        [Aggregation] ..> EventSource : retrieves from
    }

    CommandService ..> Event : writes
    CommandService ..> GameLock : acquires and releases


    [Validation] ..> GameState : retrieves
    QueryService ..> GameState : retrieves

    database EventsDB
    [Events] -left- EventsDB

    database GameStateCache
    [Aggregation] -right- GameStateCache
