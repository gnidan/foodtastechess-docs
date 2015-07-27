Component Breakdown
===================

Server
------

.. uml::

    interface RequestHandler {
        Handle(Request) Response
    }

    class Server {
    }

    interface ClientQueryInterface
    interface CommandInterface
    interface AuthenticationInterface

    Server -up- RequestHandler

    Server o-- ClientQueryInterface : injected
    Server o-- CommandInterface : injected
    Server o-- AuthenticationInterface : injected

The server component is used to interpret HTTP requests, route them to the
appropriate interface, and return a JSON response to the client.

For details on the respective interfaces, see `Client Query Service`_,
`Client Command Service`_, and `Users and Authentication`_.

Client Query Service
--------------------

.. uml::

    interface ClientQueryInterface {
        GamesForUser(user.Id) []game.Id
        GameInformation(game.Id) GameInformation
        MoveHistory(game.Id) MoveHistory
        ValidMoves(game.Id) map[Position]([]Position)
    }

    class ClientQueryService << (S,#FF7700) Service >> {
    }

    ClientQueryService .up.> ClientQueryInterface

    interface SystemQueryInterface
    interface UsersInterface
    ClientQueryService o-- SystemQueryInterface : injected
    ClientQueryService o-- UsersInterface : injected

**ClientQueryInterface** provides several methods to retrieve information
about the current state of the system/a given game:

    GamesForUser(user.Id) []game.Id
        Given a user ID, returns a list of game IDs for the user.

    GameInformation(game.Id) GameInformation
        Given a game ID, returns a record of game information, including:

            - Player names for both colors
            - Current piece positions
            - Whether or not there is an outstanding draw offer
            - Any information on check or game end

    MoveHistory(game.Id) MoveHistory
        Given a game ID, returns a list of moves in algebraic notation,
        plus the corresponding Forsythe-Edwards Notation for the resulting
        game state.

    ValidMoves(game.Id) map[Position]([]Position)
        Given a game ID, returns a map of each of the current player's
        occupied positions to a list of possible positions where the piece
        there may move.


The Client Query Service provides these interface methods by creating
*system queries* and submitting them via **System Query Interface**.
Results are then translated into the form exposed by this interface,
using augmented information from the **Users Interface**.

See `System Queries`_ and `Users and Authentication`_

Client Command Service
----------------------

.. uml::
    interface CommandInterface {
        SubmitCommand(command Command) CommandResult
    }

    interface CommandValidation {
        isValid(command Command) bool
    }

    class CommandService << (S,#FF7700) Service >> {
        publishEvent(Event)
    }

    class ValidationService << (S,#FF7700) Service >> {
        queries ClientQueryInterface
        validatorsForCommand(Command) []Validators
    }

    interface Validator {
        validate(Command, ClientQueryInterface) bool
    }

    class ActivePlayerValidator
    class MoveValidator
    class OutstandingOfferValidator

    ActivePlayerValidator .up.> Validator
    MoveValidator .up.> Validator
    OutstandingOfferValidator .up.> Validator

    CommandService .up.> CommandInterface
    CommandService o-- CommandValidation
    interface EventInterface
    CommandService o-- EventInterface : injected

    ValidationService .up.> CommandValidation
    ValidationService *-- Validator
    interface ClientQueryInterface
    ValidationService o-- ClientQueryInterface : injected

The **Command Interface** provides a single method for enacting change within
the system:

    SubmitCommand(command Command) CommandResult
        Submit a command, subjected to whatever filtering rules may exist,
        and return some result based on validity and system function.

The **Command Service** uses the **Validation Interface** to ensure validity
of input, and then submits events to the **Event Interface**.

The **Validation Service** uses a factory to aggregate **Validators**, which
then act as a pipeline filter on the incoming command. Validators can use
external interfaces to retrieve information about user accounts and game
states.


The command interface provides a method for submitting commands and getting
a resulting status.


See `Events`_  and `Client Query Service`_ for referenced interfaces.


Users and Authentication
------------------------

.. uml::
    interface UsersInterface {
        UserByUUID(uuid UUID) User
        SaveUser(User) error
    }

    interface AuthenticationInterface {
        Authenticate(params) User, bool
    }

    class UsersService << (S,#FF7700) Service >>

    UsersService .up.> UsersInterface
    UsersService .up.> AuthenticationInterface


    class User {
        UUID UUID
        DisplayName String
        Claims struct
    }

    UsersService *-- "n" User


Events
------

.. uml::
    interface EventInterface {
        Receive(Event) error
        EventsForGame(game.Id) []Event
        EventsByTypeForGame(game.Id, EventType) []Event
        ActiveGamesForPlayer(uuid UUID) []game.Id
    }

    class Event {
        GameId id
        RefId id
        RefType string
    }

    class Game {
        Id id
        BlackUUID UUID
        WhiteUUID UUID
    }

    class Move {
        Id id
        TurnNumber TurnNumber
        Move string
    }

    class DrawOffer {
        Id id
        Player Color
    }

    class DrawResponse {
        Id id
        DrawOfferId id
        Player color
        Accept bool
    }

    class Concession {
        Id id
        Player Color
    }

    class GameEnd {
        Id id
        Winner Color `null`
        Reason
    }

    Game .up.> Event
    Move .up.> Event
    DrawOffer .up.> Event
    DrawResponse .up.> Event
    Concession .up.> Event
    GameEnd .up.> Event

    interface EventSubscriberInterface {
        Receive(Event) error
    }

    interface GameEventLockInterface {
        withLockOnGame(id game.Id, func() interface{}, wait bool) interface{}, error
    }

    class EventService << (S,#FF7700) Service >>
    EventService *-- "n" Event
    EventService o-- "n" EventSubscriberInterface : injected
    EventService .up.> GameEventLockInterface
    EventService .up.> EventInterface

See `System Queries`_ for a realization of `EventSubscriberInterface`.


System Queries
--------------

.. uml::

    interface Query {
        PlayerUUID() UUID
        GameId() game.Id
        QueryType() QueryType
        TurnNumber() game.TurnNumber
    }

    interface SystemQueryInterface {
        GetAnswer(query Query) Answer
    }

    interface EventSubscriberInterface {
        Receive(Event) error
    }

    class QueryBuffer {
        queries chan Query
        process(systemQueryInterface SystemQueryInterface)
    }

    class Event
    class EventQueryTranslator {
        translate(Event) []Query
    }
    EventQueryTranslator --> Event : uses
    EventQueryTranslator --> Query : generates

    interface Answer

    class SystemQueryService << (S,#FF7700) >> {
    }

    SystemQueryService .up.> SystemQueryInterface
    SystemQueryService o-- "1" EventQueryTranslator
    SystemQueryService o-- "1" QueryBuffer
    QueryBuffer .up.> EventSubscriberInterface

    interface QueryTypeAnswerer {
        queryType() QueryType
        computeDependentQueries(Query) []Query
        computeAnswer(Query, []Answer) Answer
        getTTL() TTL
    }

    interface AnswerCache {
        Retrieve(Key) Answer, bool
        Store(Query, Answer, Expiry) error
        Delete(Query)
    }

    class AnswerCacheService << (S,#FF7700) Service >> {
    }

    AnswerCacheService .up.> AnswerCache

    class CacheEntry {
        Key CacheKey
        Value interface{}
        IssuedAt timestamp
        Expiry Expiry
    }

    AnswerCacheService o-- "n" CacheEntry



    Query *-- "1"  QueryType

    SystemQueryService o-- "n" QueryTypeAnswerer : injected
    SystemQueryService o-- "1" AnswerCache : injected
    SystemQueryService *-- "n" Query
    SystemQueryService *-- "n" Answer

    QueryType o-- "1" QueryTypeAnswerer

See `Events`_ for details on the event system.

QueryTypeAnswerer
`````````````````

.. uml::
    interface QueryTypeAnswerer

    class MoveAtTurnAnswerer .up.> QueryTypeAnswerer
    class TurnNumberAnswerer .up.> QueryTypeAnswerer
    class BoardStateAnswerer .up.> QueryTypeAnswerer
    class ValidMovesAnswerer .up.> QueryTypeAnswerer
    class ActivePlayerAnswerer .up.> QueryTypeAnswerer
    class UnmovedPositionsAnswerer .up.> QueryTypeAnswerer
    class UserGamesAnswerer .up.> QueryTypeAnswerer

    interface GameStateInterface
    interface EventInterface

    MoveAtTurnAnswerer o-- EventInterface : injected
    TurnNumberAnswerer o-- EventInterface : injected

    BoardStateAnswerer --> BoardStateAnswerer
    BoardStateAnswerer --> MoveAtTurnAnswerer

    ValidMovesAnswerer --> BoardStateAnswerer
    ValidMovesAnswerer o-- GameStateInterface : injected


    ActivePlayerAnswerer --> TurnNumberAnswerer
    note left on link
        denotes "depends on"
    end note

    UnmovedPositionsAnswerer --> MoveAtTurnAnswerer
    UnmovedPositionsAnswerer --> UnmovedPositionsAnswerer

    UserGamesAnswerer o-- EventInterface : injected


See `Events`_ and `Game Logic`_.

Game Logic
----------

.. uml::
    class Player {
        color Color
    }

    interface Piece {
        name() str
        player() Player
        moves() []Move
    }

    interface Move {
        translate(Position, GameState) []Position
    }

    Piece o-- "n" Move

    class Position {
        rank
        file
    }

    class TurnNumber {
    }

    interface GameStateInterface {
        NewGameState(turn TurnNumber, map[Position]Piece, unmovedPositions []Position)
        TurnNumber() TurnNumber
        PositionWithinBounds(Position) bool
        UnmovedPositions() []Position
        PiecePositions() []Position
        PieceAtPosition(Position) Piece
        ValidMoves(Position) []Position
    }

    class GameState .up.> GameStateInterface

    GameState *-- "n" Piece
    GameState *-- "n" Move
    GameState o-- "2" Player
    GameState o-- "n" Position
    GameState o-- "1" TurnNumber


Piece and Move Organization
```````````````````````````

.. uml::
    class SafeMove {
        rankOffset
        fileOffset
    }

    class UnboundedMove {
        rankDelta
        fileDelta
    }

    class JumpingMove {
        rankOffset
        fileOffset
    }

    class AdvancingMove {
        rankDelta
    }

    class CapturingMove {
        rankOffset
        fileOffset
    }

    class Castle {
        fileOffset
    }

    class EnPassant {
        fileOffset
    }

    SafeMove ..> Move
    UnboundedMove ..> Move
    JumpingMove ..> Move
    AdvancingMove ..> Move
    CapturingMove ..> Move
    Castle ..> Move
    EnPassant ..> Move

    class Pawn .up.> Piece
    class Rook .up.> Piece
    class Knight .up.> Piece
    class Bishop .up.> Piece
    class Queen .up.> Piece
    class King .up.> Piece



    Pawn o-- AdvancingMove
    Pawn o-- CapturingMove
    Pawn o-- EnPassant

    Rook o-- UnboundedMove

    Knight o-- JumpingMove

    Bishop o-- UnboundedMove

    Queen o-- UnboundedMove

    King o-- SafeMove
    King o-- Castle

    interface Piece {
        name() str
        player() Player
        moves() []Move
    }

    interface Move {
        translate(Position, GameState) []Position
    }

