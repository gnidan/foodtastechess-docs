Class Diagrams
==============

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

    class QueryService << ($,#FF7700) >> {
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

    /'
    class MoveAtTurnAnswerer ..> QueryTypeAnswerer
    class TurnNumberAnswerer ..> QueryTypeAnswerer
    class BoardStateAnswerer ..> QueryTypeAnswerer
    class ValidMovesAnswerer ..> QueryTypeAnswerer
    class ActivePlayerAnswerer ..> QueryTypeAnswerer
    '/

    Query *-- QueryType

    QueryService o-- "n" QueryTypeAnswerer : injected
    QueryService o-- "1" AnswerCache : injected
    QueryService *-- "n" Query
    QueryService *-- "n" Answer

    QueryTypeAnswerer o-- "1" QueryType

