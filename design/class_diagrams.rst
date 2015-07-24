Class Diagrams
==============

Game Logic
----------

.. uml::
    class Player {
        color Color
    }

    interface Piece {
        name() str
        player() Player
    }

    interface Move {
        translate(Position, GameState) []Position
    }

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

    Piece o-- Move


    Pawn ..> AdvancingMove
    Pawn ..> CapturingMove
    Pawn ..> EnPassant

    Rook ..> UnboundedMove

    Knight ..> JumpingMove

    Bishop ..> UnboundedMove

    Queen ..> UnboundedMove

    King ..> SafeMove
    King ..> Castle

    class Position {
        rank
        file
    }

    class TurnNumber {
    }

    class GameState {
        turnNumber() TurnNumber
        positionWithinBounds(Position) bool
        positionsOfUnmovedPieces() []Position
        piecePositions() []Position
        pieceAtPosition(Position) Piece
        validMoves(Position) []Position
    }

    GameState *-- "n" Piece
    GameState *-- "n" Move
    GameState o-- "2" Player
    GameState o-- "n" Position
    GameState o-- "1" TurnNumber


Game Aggregation
----------------

.. uml::
    class AnswerCache << (S,#FF7700) Service >> {
        Retrieve(Key) Answer, bool
        Store(Query, Answer, Expiry) error
    }

    class CacheEntry {
        Key CacheKey
        Value interface{}
        IssuedAt timestamp
        Expiry Expiry
    }

    AnswerCache o-- "n" CacheEntry

    class Query {
        GameId game.Id
        QueryType QueryType
        TurnNumber game.TurnNumber
    }

    class Answer

    class QueryService << (S,#FF7700) >> {
        answerers map[QueryType]QueryTypeAnswerer
        answerCache AnswerCache

        getAnswer(Query Query) Answer
    }

    abstract class QueryTypeAnswerer {
        QueryType QueryType
        computeDependentQueries(Query) []Query
        computeAnswer(Query, []Answer) Answer
        getTTL() TTL
    }

    Query *-- QueryType

    QueryService o-- "n" QueryTypeAnswerer : injected
    QueryService o-- "1" AnswerCache : injected
    QueryService *-- "n" Query
    QueryService *-- "n" Answer

    QueryTypeAnswerer o-- "1" QueryType





QueryTypeAnswerer
`````````````````

.. uml::
    class MoveAtTurnAnswerer .up.> QueryTypeAnswerer
    class TurnNumberAnswerer .up.> QueryTypeAnswerer
    class BoardStateAnswerer .up.> QueryTypeAnswerer
    class ValidMovesAnswerer .up.> QueryTypeAnswerer
    class ActivePlayerAnswerer .up.> QueryTypeAnswerer
    class UnmovedPieceAnswerer .up.> QueryTypeAnswerer

