Overview of Client Tests
------------------------

+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
|  ID  | Test Desciption | Requirement  | Execution Steps  | Expected Results  | Actual Results  | Comments |
+======+=================+==============+==================+===================+=================+==========+
|  C1  | View active     | Users will   | 1. Authenticate  | Users see all     | It will be as   | Code     |
|      |   games         | be able to   | 2. Visit main    | their active      | expected        | Needed   |
|      |                 | log in and   |    screen        | and inactive      |                 |          |
|      |                 | view their   | 3. View games    | games.            |                 |          |
|      |                 | active chess |                  |                   |                 |          |
|      |                 | games, if    |                  |                   |                 |          |
|      |                 | any exist    |                  |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
|  C2  | Users Set User  | Users will   | 1. User is       | Options are       | It will be as   | Code     |
|      | Account Settings| be able to   |    Logged in     | present on next   | expected        | Needed   |
|      |                 | change their | 2. User clicks   | startup           |                 |          |
|      |                 | account      |    on the        |                   |                 |          |
|      |                 | settings -   |    settings      |                   |                 |          |
|      |                 | Such as      | 3. User selects  |                   |                 |          |
|      |                 | preferred    |    options       |                   |                 |          |
|      |                 | piece color  | 4. Save          |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
|  C3  | View or continue| The user     | 1. User is       | User is able to   | It will be as   | Code     |
|      | a game          | will be able |    logged in     | continue or view  | expected        | Needed   |
|      |                 | to select a  | 2. User selects  | a game            |                 |          |
|      |                 | game to      |    a game        |                   |                 |          |
|      |                 | continue or  |                  |                   |                 |          |
|      |                 | view         |                  |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
|  C4  | Available to    |              |                  |                   |                 |          |
|      | user on their   |              |                  |                   |                 |          |
|      | turn:           |              |                  |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
| C4.1 | Movement 1      | Moving a     | 1. It is the     | The piece is      | It will be as   | Code     |
|      |                 | piece by     |    user's move   | moved             | expected        | Needed   |
|      |                 | clicking on  | 2. They click    |                   |                 |          |
|      |                 | their piece  |    on a piece    |                   |                 |          |
|      |                 | and then     |    then a square |                   |                 |          |
|      |                 | clicking on  | 3. The piece     |                   |                 |          |
|      |                 | a valid      |    moves         |                   |                 |          |
|      |                 | place to     |                  |                   |                 |          |
|      |                 | move to      |                  |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
| C4.2 | Movement 2      | Moving a     | 1. It is the     | The piece is      | It will be as   | Code     |
|      |                 | piece by     |    user's move   | moved             | expected        | Needed   |
|      |                 | clicking on  | 2. They click    |                   |                 |          |
|      |                 | their piece  |    on a piece    |                   |                 |          |
|      |                 | and then     |    and drag it   |                   |                 |          |
|      |                 | dragging the |    into place    |                   |                 |          |
|      |                 | piece there  | 3. The piece     |                   |                 |          |
|      |                 |              |    moves         |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
| C4.3 | Offer a draw    | Offering a   | 1. It is user's  | Opponent recieves | It will be as   | Code     |
|      |                 | Draw         |    move          | offer             | expected        | Needed   |
|      |                 |              | 2. Turn is       |                   |                 |          |
|      |                 |              |    defered for   |                   |                 |          |
|      |                 |              |    draw          |                   |                 |          |
|      |                 |              | 3. Opponent      |                   |                 |          |
|      |                 |              |    recieves draw |                   |                 |          |
|      |                 |              |    offer         |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
| C4.4 | Defer           | Deferring    | 1. It is the     | Nothing happens   | Nothing happens |          |
|      |                 | their turn   |    user's move   |                   |                 |          |
|      |                 | until they   | 2. They do not   |                   |                 |          |
|      |                 | are ready    |    move          |                   |                 |          |
|      |                 | to play      |                  |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
| C4.5 | Resign          | Resign from  | 1. It is the     | Opponent is       | It will be as   | Code     |
|      |                 | a game       |    user's move   | given a win       | expected        | Needed   |
|      |                 |              | 2. They click    |                   |                 |          |
|      |                 |              |    resign        |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
|  C5  | Invite to game  | Invite other | 1. User starts   | Opponent recieves | It will be as   | Code     |
|      |                 | users to a   |    a game        | email inviting    | expected        | Needed   |
|      |                 | game         | 2. Enter email   | them to play      |                 |          |
|      |                 |              |    address for   |                   |                 |          |
|      |                 |              |    their         |                   |                 |          |
|      |                 |              |    opponent      |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+
|  C6  | Client valid    | Checking for | 1. It is a       | Valid moves for   | It will be as   | Code     |
|      | moves           | valid moves  |    user's move   | a piece are shown | expected        | Needed   |
|      |                 |              | 2. They select   |                   |                 |          |
|      |                 |              |    a piece       |                   |                 |          |
+------+-----------------+--------------+------------------+-------------------+-----------------+----------+


Login Screen
============

+------+------------------+--------------+-----------------+-------------------+-----------------+----------+
|  ID  | Test Desciption  | Requirement  | Execution Steps | Expected Results  | Actual Results  | Comments |
+======+==================+==============+=================+===================+=================+==========+
|  L1  | Google Accounts  | The app will | 1. At login     | Prompt appears    | Prompt appears  | Auth is  |
|      |                  | allow the    |    user is      |                   |                 | done     |
|      |                  | user to log  |    presented    |                   |                 |          |
|      |                  | in using a   |    with prompt  |                   |                 |          |
|      |                  | Google       |    to login     |                   |                 |          |
|      |                  | account      |    with google  |                   |                 |          |
+------+------------------+--------------+-----------------+-------------------+-----------------+----------+
|  L2  | Already logged   | If the user  | 1. User is      | Verification      | Verifacation    |          |
|      | into google,     | is already   |    logged into  | appears           | appears         |          |
|      | verify app       | logged in to |    google       |                   |                 |          |
|      |                  | a Google     | 2. App requests |                   |                 |          |
|      |                  | account      |    permission   |                   |                 |          |
|      |                  | within their |                 |                   |                 |          |
|      |                  | browser they |                 |                   |                 |          |
|      |                  | will be      |                 |                   |                 |          |
|      |                  | taken to a   |                 |                   |                 |          |
|      |                  | verification |                 |                   |                 |          |
|      |                  | page         |                 |                   |                 |          |
+------+------------------+--------------+-----------------+-------------------+-----------------+----------+
|  L3  | Logged and       | If the       | 1. User is      | User sees lobby   | User sees lobby |          |
|      | Verified         | user's       |    logged and   | screen            | screen          |          |
|      |                  | Google       |    verified     |                   |                 |          |
|      |                  | account is   |                 |                   |                 |          |
|      |                  | properly     |                 |                   |                 |          |
|      |                  | authed the   |                 |                   |                 |          |
|      |                  | application  |                 |                   |                 |          |
|      |                  | will take    |                 |                   |                 |          |
|      |                  | the user to  |                 |                   |                 |          |
|      |                  | the Lobby    |                 |                   |                 |          |
|      |                  | Screen       |                 |                   |                 |          |
+------+------------------+--------------+-----------------+-------------------+-----------------+----------+
| L4.1 | Username display | Google       | 1. User logged  | User sees name    | Nothing at      | Code     |
|      |                  | username is  |    in           | in top right      | moment          | Needed   |
|      |                  | displayed in |                 | corner            |                 |          |
|      |                  | the top      |                 |                   |                 |          |
|      |                  | right corner |                 |                   |                 |          |
|      |                  | of all       |                 |                   |                 |          |
|      |                  | subsequent   |                 |                   |                 |          |
|      |                  | screens.     |                 |                   |                 |          |
+------+------------------+--------------+-----------------+-------------------+-----------------+----------+
| L4.5 | Username logout  | This [the    | 1. User logged  | Name is top right | Nothing at      | Code     |
|      |                  | uname] will  |    in           | allows a logout   | moment          | Needed   |
|      |                  | act as a     |                 |                   |                 |          |
|      |                  | link via     |                 |                   |                 |          |
|      |                  | which the    |                 |                   |                 |          |
|      |                  | user may     |                 |                   |                 |          |
|      |                  | log out.     |                 |                   |                 |          |
+------+------------------+--------------+-----------------+-------------------+-----------------+----------+

Lobby Screen
============

+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
|  ID  | Test Desciption | Requirement  | Execution Steps | Expected Results | Actual Results  | Comments |
+======+=================+==============+=================+==================+=================+==========+
| L5.1 | Games list      | The app      | 1. View lobby   | List of games is | Nothing at      | Code     |
|      |                 | displays a   |    screen       | present (all)    | moment          | Needed   |
|      |                 | list of all  |                 |                  |                 |          |
|      |                 | games that   |                 |                  |                 |          |
|      |                 | the user is  |                 |                  |                 |          |
|      |                 | currently    |                 |                  |                 |          |
|      |                 | playing and  |                 |                  |                 |          |
|      |                 | all          |                 |                  |                 |          |
|      |                 | completed    |                 |                  |                 |          |
|      |                 | games in     |                 |                  |                 |          |
|      |                 |  which the   |                 |                  |                 |          |
|      |                 | user has     |                 |                  |                 |          |
|      |                 | participated |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
| L5.2 | Games list      | For each     | 1. View lobby   | See detailed list| Nothing at      | Code     |
|      | detailed        | game the app |    screen       |                  | moment          | needed   |
|      |                 | provides the |                 |                  |                 |          |
|      |                 | opponent’s   |                 |                  |                 |          |
|      |                 | name, a      |                 |                  |                 |          |
|      |                 | token        |                 |                  |                 |          |
|      |                 | string, and  |                 |                  |                 |          |
|      |                 | the game’s   |                 |                  |                 |          |
|      |                 | state        |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
|  L6  | Game choice     | The user     | 1. User selects | They are taken   | Nothing at      | Code     |
|      |                 | may choose   |    a game to    | into the game    | moment          | Needed   |
|      |                 | a game which |    play         |                  |                 |          |
|      |                 | will present |                 |                  |                 |          |
|      |                 | them with a  |                 |                  |                 |          |
|      |                 | In-Game      |                 |                  |                 |          |
|      |                 | Screen       |                 |                  |                 |          |
|      |                 | corre-       |                 |                  |                 |          |
|      |                 | sponding     |                 |                  |                 |          |
|      |                 | to that game |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+
|  L7  | Game Creation   | The app      | 1. User selects | They are able to | Screen exists   | Code     |
|      |                 | provides an  |    new game     | create a game    | No game created | Needed   |
|      |                 | option for   |    at lobby     |                  |                 |          |
|      |                 | the user to  |    screen       |                  |                 |          |
|      |                 | create a new |                 |                  |                 |          |
|      |                 |  game, which |                 |                  |                 |          |
|      |                 | will take    |                 |                  |                 |          |
|      |                 | the user to  |                 |                  |                 |          |
|      |                 | the New Game |                 |                  |                 |          |
|      |                 | Screen       |                 |                  |                 |          |
+------+-----------------+--------------+-----------------+------------------+-----------------+----------+


New Game Screen
===============


+------+-----------------+--------------+-----------------+------------------+----------------+-----------+
|  ID  | Test Desciption | Requirement  | Execution Steps | Expected Results | Actual Results | Comments  |
+======+=================+==============+=================+==================+================+===========+
|  N1  | Color Choice    | The app      | 1. Start a game | Color is carried | Nothing at     | Screen    |
|      |                 | allows a     | 2. Choose color | over into game   | moment         | and board |
|      |                 | user to      |                 |                  |                | exist,    |
|      |                 | choose       |                 |                  |                | no link   |
|      |                 | whether they |                 |                  |                | yet. Code |
|      |                 | wish to play |                 |                  |                | needed.   |
|      |                 | black, white |                 |                  |                |           |
|      |                 | or no        |                 |                  |                |           |
|      |                 | preference   |                 |                  |                |           |
+------+-----------------+--------------+-----------------+------------------+----------------+-----------+
|  N2  | Game invite     | Repeat of C5 |                 |                  |                |           |
+------+-----------------+--------------+-----------------+------------------+----------------+-----------+
|  N3  | User is sent to | The app      | 1. Game is      | Game starts      | Nothing at     | Code      |
|      | game            | provides a   |    started      |                  | moment         | Needed    |
|      |                 | button that  | 2. Color is     |                  |                |           |
|      |                 | creates the  |    chosen       |                  |                |           |
|      |                 | new game     | 3. Opponent is  |                  |                |           |
|      |                 | instance and |    invited      |                  |                |           |
|      |                 | takes the    |                 |                  |                |           |
|      |                 | user to an   |                 |                  |                |           |
|      |                 | In-Game      |                 |                  |                |           |
|      |                 | Screen of    |                 |                  |                |           |
|      |                 | the new game |                 |                  |                |           |
+------+-----------------+--------------+-----------------+------------------+----------------+-----------+


