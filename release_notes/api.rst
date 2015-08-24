API Calls
=========

The api is straight-forward and is not limited to our client in its use.

Auth
----

+---------------------------------+--------------------------------------------+
| API Endpoint Request Target     | Result                                     |
+=================================+============================================+
| /auth/login                     | Allows the api to log the user into the    |
|                                 | app and authenticate with google           |
+---------------------------------+--------------------------------------------+
| /auth/callback                  | Starts a new auth session and provides a   |
|                                 | cookie to the client                       |
+---------------------------------+--------------------------------------------+
| /auth/me                        | Provides information about the current     |
|                                 | user or throws an error                    |
+---------------------------------+--------------------------------------------+

Get Calls
---------

+---------------------------------+--------------------------------------------+
| API Endpoint Request Target     | Result                                     |
+=================================+============================================+
| /games                          | A list of games for the user whose         |
|                                 | cookie is being used                       |
+---------------------------------+--------------------------------------------+
| /games/:id                      | Game information for the requested game    |
+---------------------------------+--------------------------------------------+
| /games/:id/history              | The full move history for the requested    |
|                                 | game                                       |
+---------------------------------+--------------------------------------------+
| /games/:id/validmoves           | Shows the valid moves for the current move |
|                                 | and board states that result.  These will  |
|                                 | show only the moves that the server will   |
|                                 | accept                                     |
+---------------------------------+--------------------------------------------+

Post Calls
----------

+---------------------------------+--------------------------------------------+
| API Endpoint Request Target     | Result                                     |
+=================================+============================================+
| /games/create                   | Game is created if color:white or color    |
|                                 | :black is given with user at those colors  |
|                                 | If neither is given, then the user is      |
|                                 | assigned a random color                    |
+---------------------------------+--------------------------------------------+
| /games/:id/join                 | User joins :id game if it is available     |
+---------------------------------+--------------------------------------------+
| /games/:id/move                 | User plays move: {algebraic move} in the   |
|                                 | game that matches the id if possible. The  |
|                                 | format of moves is {Piece Abbr}{Source}    |
|                                 | -{Destitation} such that Pb7-b5 is a valid |
|                                 | move.                                      |
+---------------------------------+--------------------------------------------+

