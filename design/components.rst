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
    :scale: 50 %

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
        UserByUUID(uuid UUID) User, error
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

The **Users Interface** provides two methods, one for retrieving, and one for
saving:

    UserByUUID(uuid UUID) User, error
        Given a universally-unique identifier (UUID), returns a User object
        or an error.

    SaveUser(User) error
        Given a User object, add or update the user in the database. May
        return an error.

The **Authentication Interface** provides an interface to authenticate an
incoming request. The **Users Service** uses third-party OAuth tools to provide
this behavior.


Events
------

.. uml::
    :scale: 50 %
    interface EventInterface {
        Receive(Event) error
        EventsForGame(game.Id) []Event
        EventsByTypeForGame(game.Id, EventType) []Event
        ActiveGamesForPlayer(uuid UUID) []game.Id, error
    }

    interface EventSubscriberInterface {
        Receive(Event) error
    }

    interface GameEventLockInterface {
        withLockOnGame(id game.Id, func() interface{}, wait bool) interface{}, error
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

    class EventService << (S,#FF7700) Service >>
    EventService *-- "n" Event
    EventService o-- "n" EventSubscriberInterface : injected
    EventService .up.> GameEventLockInterface
    EventService .up.> EventInterface


The **Event Interface** provides the following methods for receiving
and searching for events.

    Receive(Event) error
        Given an event, store it and propagate it through the system,
        or return an error.

    EventsForGame(game.Id) []Event
        Given a game ID, returns a list of all events for that game.

    EventsByTypeForGame(game.Id, EventType) []Event
        Given a game ID and an event type, finds all events of that type
        for that game.

    ActiveGamesForPlayer(uuid UUID) []game.Id, error
        Given a player's UUID, return a list of games the user is
        participating in, or has participated in. Returns an error
        if the user does not exist.

The **Event Subscriber Interface** provides a mechanism by which
external system components may be notified upon events. The interface
uses a single method:

    Receive(Event) error
        Given an event, perform some state computation, possibly
        returning an error.

The **Game Event Lock Interface** provides a means with which event-generating
systems may ensure mutual exclusion on game resources. The interface provides
a single method:

    withLockOnGame(id game.Id, func() interface{}, wait bool) interface{}, error
        Given a game ID, a function, and whether or not the lock acquisition
        should wait or die, **withLockOnGame** attempts to acquire the lock
        and then runs the provided function, releasing when complete.

The **Event Service** realizes these interfaces using an append-only log
in a database.

See `System Queries`_ for a realization of the **Event Subscriber Interface**.


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

The **System Query Interface** provides a means of getting answers to specific
and codified questions.

**Queries** are objects which must be able to answer the following questions,
possibly with null values. These values constitute a unique key for which
the query --> answer relation may be referentially transparent.

    PlayerUUID() UUID
        The player UUID. *Only used for the **UserGames** query type.*

    GameId() game.Id
        The game ID. Not used for **UserGames** query type.

    QueryType() QueryType
        The type of query, e.g., the move at a given turn, the board state
        at a given turn.

    TurnNumber() game.TurnNumber
        The turn number argument for the query type. May not be used
        for all types.

The **System Query Services** uses an **Answer Cache**, stored in a document
store (MongoDB), where each document has an expiry that may either be
a timestamp or a turn number. Query Types have dependent queries, and
the service computes answers or retrieves them if previously stored,
storing the answers for a time.

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
    class DrawOfferAnswerer .up.> QueryTypeAnswerer
    class UserGamesAnswerer .up.> QueryTypeAnswerer

    interface GameStateInterface
    interface EventInterface

    MoveAtTurnAnswerer o-- EventInterface : injected
    TurnNumberAnswerer o-- EventInterface : injected

    BoardStateAnswerer --> BoardStateAnswerer
    BoardStateAnswerer --> MoveAtTurnAnswerer

    ValidMovesAnswerer --> BoardStateAnswerer
    ValidMovesAnswerer o-- GameStateInterface : injected

    DrawOfferAnswerer --> DrawOfferAnswerer
    DrawOfferAnswerer o-- EventInterface : injected

    ActivePlayerAnswerer --> TurnNumberAnswerer
    note left on link
        denotes "depends on"
    end note

    UnmovedPositionsAnswerer --> MoveAtTurnAnswerer
    UnmovedPositionsAnswerer --> UnmovedPositionsAnswerer

    UserGamesAnswerer o-- EventInterface : injected

The system supports a number of different query types, each providing its own
**Answerer**

Supported Query Types:

    MoveAtTurn
        The move for a given turn in the game. Interfaces with `Events`_ to
        retrieve moves.

    TurnNumber
        The current turn for a game. Interfaces with `Events`_ to
        maintain consistency.

    BoardStateAtTurn
        Depends on BoardStateAtTurn(n-1) and the MoveAtTurn(n)
        queries and computes the next board state.

    ValidMovesAtTurn
        Returns a list of valid moves the active player can make.

    ActivePlayer
        Based on the TurnNumber, returns the active player.

    UnmovedPositionsAtTurn
        Returns a list of positions for pieces that haven't moved
        all game up to that point.

    DrawOffer
        Whether or not there is an outstanding draw offer.

    UserGames
        The list of games associated with that player UUID.

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

    interface ValidityFilter {
        filter(GameState, Position, []Position) []Position
    }

    class CheckFilter {
    }

    CheckFilter ..> ValidityFilter

    class GameState .up.> GameStateInterface

    GameState *-- "n" Piece
    GameState *-- "n" Move
    GameState o-- "2" Player
    GameState o-- "n" Position
    GameState o-- "1" TurnNumber
    GameState o-- "n" ValidityFilter

Game logic in **foodtastechess** works by having multiple **pieces**, each of which
is defined as having multiple **move** options. **Moves** provide a means by
which positions may be translated into a list of available positions, given
a game state.

Essentially, given a game state (piece positions, etc.), pieces compose moves,
which are responsible for translating positions into other positions,
keeping in mind the other pieces on the board at the time.

Move validity is then passed through a single **Validity Filter**, the
**Check Filter**, to prevent the player from moving into check.

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

There are a number of different *types* of moves in chess, and this system
organizes them as follows:

    SafeMove
        Given a rank offset and a file offset, moves the piece into that
        position assuming it is not at risk of being captured.

    UnboundedMove
        Given a rank and file delta, moves the piece to any number of pieces
        in a line, up to and including an enemy piece (capturing it), or
        right before a friendly piece.

    JumpingMove
        Moves the piece to a specific rank and file offset, if the
        spot is empty or occupied by an enemy piece (capturing it).

    AdvancingMove
        Used by pawns to move 1 or 2 spaces (if the first move), and
        to promote the pawn into a queen or other piece at the end.

    CapturingMove
        Used by pawns to represent moves that must involve a capture.

    EnPassant
        Used by pawns to capture in the scenario of *en passant*.

    Castle
        Used by the king to switch places with a rook if the king has
        not yet moved.

