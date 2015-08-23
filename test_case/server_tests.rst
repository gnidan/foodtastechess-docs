Server Application
==================

Recieving of Moves
------------------

+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
|  ID  | Test Desciption | Requirement  | Execution Steps | Expected Results | Actual Results  | Comments |
+======+=================+==============+=================+==================+=================+==========+
|  R1  | Server Input    | Server must  | 1. Clients are  | Server does not  | We have been    | Yet      |
|      |                 | take in      |    playing      | crash            | unable to crash |          |
|      |                 | multiple     |    multiple     |                  | our server      |          |
|      |                 | moves per    |    games        |                  |                 |          |
|      |                 | second from  | 2. Many messages|                  |                 |          |
|      |                 | a variety of |    are sent in  |                  |                 |          |
|      |                 | games        |    second due to|                  |                 |          |
|      |                 |              |    demand       |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
| R2.1 | Refresh game    | Server must  | 1. Client sends | Server responds  | Nothing at      | Code     |
|      | state           | respond with |    move         | with information | moment          | Needed   |
|      |                 | the updated  |                 | for next move    |                 |          |
|      |                 | game state   |                 |                  |                 |          |
|      |                 | after a      |                 |                  |                 |          |
|      |                 | valid move   |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
| R2.2 | Refresh valid   | The game     | 1. Client sends | Server responds  | Nothing at      | Code     |
|      | moves           | state will   |    move         | with information | moment          | Needed   |
|      |                 | be           |                 | for next move    |                 |          |
|      |                 | accompanied  |                 |                  |                 |          |
|      |                 | by all valid |                 |                  |                 |          |
|      |                 | moves that   |                 |                  |                 |          |
|      |                 | the client   |                 |                  |                 |          |
|      |                 | may make     |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+

+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
|  ID  | Test Desciption | Requirement  | Execution Steps | Expected Results | Actual Results  | Comments |
+======+=================+==============+=================+==================+=================+==========+
|  R3  | Recreate games  | Invalid      | 1. Client       | Game is resumed  | Nothing at      | Code     |
|      |                 | games are    |    requests a   | as if it was in  | moment          | Needed   |
|      |                 | not kept in  |    games not in | memory           |                 |          |
|      |                 | memory, but  |    memory       |                  |                 |          |
|      |                 | instead      |                 |                  |                 |          |
|      |                 | recreated    |                 |                  |                 |          |
|      |                 | with each    |                 |                  |                 |          |
|      |                 | request      |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
|  R4  | Same accounts   | Moves must   | 1. Client       | They are         | They are        | Code     |
|      |                 | be made by   |    attempts to  | prevented        | prevented       | Needed   |
|      |                 | the same two |    play in a    |                  |                 |          |
|      |                 | Google       |    game that it |                  |                 |          |
|      |                 | authed       |    is not in    |                  |                 |          |
|      |                 | accounts     |                 |                  |                 |          |
|      |                 | throughout   |                 |                  |                 |          |
|      |                 | the game on  |                 |                  |                 |          |
|      |                 | their        |                 |                  |                 |          |
|      |                 | respective   |                 |                  |                 |          |
|      |                 | sides        |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+

Validation of Moves
-------------------


+------+------------------+--------------+------------------+-------------------+----------------+----------+
|  ID  | Test Desciption  | Requirement  | Execution Steps  | Expected Results  | Actual Results | Comments |
+======+==================+==============+==================+===================+================+==========+
|  V1  | Send Valid Moves | The server   | 1. Client is in  | Client recieves   | Nothing at     | Code     |
|      |                  | will calc    |    a position to | a list of valid   | moment         | Needed   |
|      |                  | all valid    |    play          | moves             |                |          |
|      |                  | moves for a  |                  |                   |                |          |
|      |                  | given game   |                  |                   |                |          |
|      |                  | board and    |                  |                   |                |          |
|      |                  | send them to |                  |                   |                |          |
|      |                  | the client   |                  |                   |                |          |
+------+------------------+--------------+------------------+-------------------+----------------+----------+
|  V2  | Correct Valid    | The server   | 1. Moves are     | All moves are     | Code is being  | Code     |
|      | Moves            | must calc    |    recieved      | valid             | written        | Needed   |
|      |                  | the moves in | 2. Check if they |                   |                |          |
|      |                  | accordance   |    are           |                   |                |          |
|      |                  | with the     |                  |                   |                |          |
|      |                  | FIDE         |                  |                   |                |          |
+------+------------------+--------------+------------------+-------------------+----------------+----------+
|  V3  | Special Valid    | The server                                                                      |
|      | Moves            | must                                                                            |
|      |                  | properly                                                                        |
|      |                  | account for                                                                     |
|      |                  | special                                                                         |
|      |                  | rules                                                                           |
|      |                  | including,                                                                      |
|      |                  | but not                                                                         |
|      |                  | limited to:                                                                     |
+------+------------------+--------------+------------------+-------------------+----------------+----------+
| V3.1 | En Passant       | En Passant   | 1. Board         | App allows user   | Nothing at     | Code     |
|      |                  |              |    position is   | to use En Passant | Moment         | Needed   |
|      |                  |              |    that which    |                   |                |          |
|      |                  |              |    enables En    |                   |                |          |
|      |                  |              |    Passant       |                   |                |          |
+------+------------------+--------------+------------------+-------------------+----------------+----------+
| V3.2 | Castling         | Castling     | 1. Board         | App allows user   | Nothing at     | Code     |
|      |                  |              |    position is   | to Castle         | Moment         | Needed   |
|      |                  |              |    that which    |                   |                |          |
|      |                  |              |    enables       |                   |                |          |
|      |                  |              |    Castling      |                   |                |          |
+------+------------------+--------------+------------------+-------------------+----------------+----------+
| V3.3 | Promotion        | Promotion    | 1. Board         | App allows user   | Nothing at     | Code     |
|      |                  |              |    position is   | to Promote        | Moment         | Needed   |
|      |                  |              |    that which    |                   |                |          |
|      |                  |              |    enables       |                   |                |          |
|      |                  |              |    Promotion     |                   |                |          |
+------+------------------+--------------+------------------+-------------------+----------------+----------+


+------+------------------+--------------+------------------+-------------------+----------------+----------+
|  ID  | Test Desciption  | Requirement  | Execution Steps  | Expected Results  | Actual Results | Comments |
+======+==================+==============+==================+===================+================+==========+
| V3.4 | Threefold        | Threefold    | 1. Board         | The game is a     | Nothing at     | Code     |
|      | Repetition       | Repetition   |    position is   | draw              | Moment         | Needed   |
|      |                  |              |    that of       |                   |                |          |
|      |                  |              |    threefold     |                   |                |          |
|      |                  |              |    Repition      |                   |                |          |
+------+------------------+--------------+------------------+-------------------+----------------+----------+
|  V4  | Move Control     | The client   | 1. Client tries  | Server prevents   | Nothing at     | Code     |
|      |                  | may not make |    to make an    | client            | moment         | Needed   |
|      |                  | any moves    |    illegal move  |                   |                |          |
|      |                  | not given    |                  |                   |                |          |
|      |                  | by the       |                  |                   |                |          |
|      |                  | server       |                  |                   |                |          |
+------+------------------+--------------+------------------+-------------------+----------------+----------+

Recording of Moves
------------------


+------+-----------------+--------------+-----------------+-------------------+----------------+----------+
|  ID  | Test Desciption | Requirement  | Execution Steps | Expected Results  | Actual Results | Comments |
+======+=================+==============+=================+===================+================+==========+
|  RM1 | Game Lock       | Upon         | 1. Client sends | The second move   | Nothing yet    | Code     |
|      |                 | receiving a  |    two moves in | does not go       |                | Needed   |
|      |                 | prospective  |    rapid        | through           |                |          |
|      |                 | move, the    |    succession   |                   |                |          |
|      |                 | server must  |                 |                   |                |          |
|      |                 | lock the     |                 |                   |                |          |
|      |                 | game until   |                 |                   |                |          |
|      |                 | the move has |                 |                   |                |          |
|      |                 | been         |                 |                   |                |          |
|      |                 | recorded and |                 |                   |                |          |
|      |                 | the clients  |                 |                   |                |          |
|      |                 | have been    |                 |                   |                |          |
|      |                 | updated      |                 |                   |                |          |
+------+-----------------+--------------+-----------------+-------------------+----------------+----------+
|  RM2 | Server Record   | The server   | 1. Client sends | Move is stored in | Nothing yet    | Code     |
|      |                 | will send    |    valid move   | database          |                | Needed   |
|      |                 | changes in   | 2. Server       |                   |                |          |
|      |                 | game state   |    accepts      |                   |                |          |
|      |                 | to the       | 3. Server sends |                   |                |          |
|      |                 | database     |    to DB        |                   |                |          |
|      |                 | to record    |                 |                   |                |          |
+------+-----------------+--------------+-----------------+-------------------+----------------+----------+


Database Application
====================

Recording of Moves
------------------


+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  DR1 | Database saves  | The database| 1. Client sends | That move and    | Correct        |          |
|      | approved moves  | will accept |    valid move   | only that move   |                |          |
|      |                 | moves that  | 2. Server       | is saved         |                |          |
|      |                 | have been   |    accepts      |                  |                |          |
|      |                 | approved the| 3. Server sends |                  |                |          |
|      |                 | server      |    to DB        |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  DR2 | Database record | The database| 1. Query DB     | Game states and  | Only move      | Saves    |
|      | game states and | will record |    for a given  | move history     | history stored | disk     |
|      | move history    | the move    |    game         | returned         |                | space and|
|      |                 | history     |                 |                  |                | board    |
|      |                 | along with  |                 |                  |                | state can|
|      |                 | the all     |                 |                  |                | be       |
|      |                 | board states|                 |                  |                | recreated|
|      |                 | using       |                 |                  |                | from     |
|      |                 | Edward’s    |                 |                  |                | moves    |
|      |                 | Notation    |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Retrieving State
----------------


+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  RS1 | Integrity of    | After       | 1. Write to DB  | Server recieves  | Database just  | Shown to |
|      | data            | a write, the|                 | board state and  | writes         | be not   |
|      |                 | database    |                 | move list in     |                | needed   |
|      |                 | will return |                 | return           |                |          |
|      |                 | to the      |                 |                  |                |          |
|      |                 | server the  |                 |                  |                |          |
|      |                 | complete    |                 |                  |                |          |
|      |                 | board state |                 |                  |                |          |
|      |                 | list and the|                 |                  |                |          |
|      |                 | move list   |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  RS2 | Crash Resistant | After a     | 1. Crash the    | Data is as it was| Not tested     | Server   |
|      |                 | crash, the  |    server       | on last write    |                | has not  |
|      |                 | database    |                 |                  |                | crashed  |
|      |                 | will        |                 |                  |                |          |
|      |                 | retrieve the|                 |                  |                |          |
|      |                 | last known  |                 |                  |                |          |
|      |                 | state       |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
