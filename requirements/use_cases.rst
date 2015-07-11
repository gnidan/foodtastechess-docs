Use Cases
=========

Login Flow
----------

Precondition
~~~~~~~~~~~~

- The user visits the site for the first time in a new browser.

Main Flow
~~~~~~~~~

1. The system presents the user with a button to login using their
   Google Account
2. The user clicks the login button and is taken to Google's site
   to authenticate with their Google account.
3. The user is presented with the option to authorize as themselves to
   **foodtastechess**
4. The user chooses to authorize.
5. The user is brought back to the application

Post-Condition
~~~~~~~~~~~~~~

- The user is logged in to the application.


Create Game Flow
----------------

Precondition
~~~~~~~~~~~~

- The user has logged in.
- The user is viewing the *Lobby screen*

Main Flow
~~~~~~~~~

1. The system presents a "Create New Game" button.
2. The user clicks the "Create New Game" button.
3. The system presents a modal popup with a screen with game options.
   The system also presents a text box with a unique *game invite URL* and
   a button to copy the URL to the clipboard.
4. The user clicks the button to copy the URL.
5. The system changes this button to "Start Game."
6. The user (externally to the system) sends the copied URL to a friend.
7. The system, meanwhile, brings the user to the *In-Game screen*.

Post-Condition
~~~~~~~~~~~~~~

- The user sees the game screen and may begin playing, provided it is
  their turn.


Join Game Flow
--------------

Precondition
~~~~~~~~~~~~

- The user has been given a *game invite URL*.
- The user opens the URL in a web browser.
- If necessary, the user logs in following the `Login Flow`_.

Main Flow
~~~~~~~~~

1. The system presents the user with a modal popup confirmation dialog
   presenting the game options. The dialog includes a button labeled
   "Start Game."
2. The user accepts the options and presses the button.
3. The system brings the user to the *In-Game screen*.

Post-Condition
~~~~~~~~~~~~~~

- The user sees the game screen and may begin playing, provided it is
  their turn.


Return to Lobby Flow
--------------------

Precondition
~~~~~~~~~~~~

Main Flow
~~~~~~~~~

Post-Condition
~~~~~~~~~~~~~~


Make Move Flow
--------------

Precondition
~~~~~~~~~~~~

- The user is in the *In-Game screen*.
- It is the user's turn in the game presented: the *turn marker label*
  reads "YOUR TURN."

Main Flow
~~~~~~~~~

Click Twice Method
``````````````````

1. The user clicks a piece.
2. The system highlights the valid squares where the piece may move.
3. The user clicks one of the highlighted squares.
4. By default, the system shows the piece in the new square and
   presents a popover menu with two buttons:

   - An *X* button : Canceling the move
   - A *Check* button : Confirming the move.

5. The user clicks the *Check* button.

Click and Drag Method
`````````````````````

1. The user presses the mouse button on a piece without releasing it.
   (**Click and Drag** gesture)
2. The system highlights the valid squares where the piece may move.
3. The user moves the mouse to the valid square.
4. The system presents the piece moving along with the mouse cursor.
5. The user releases the mouse button.
6. By default, the system shows the piece in the new square and
   presents a popover menu with two buttons:

   - An *X* button : Canceling the move
   - A *Check* button : Confirming the move.

7. The user clicks the *Check* button.

Post-Condition
~~~~~~~~~~~~~~

- The piece is in the selected new location.
- The *turn marker label* reads "*[opponent's name]*'S TURN."


Invalid Move Flow
-----------------

Precondition
~~~~~~~~~~~~

- The user has followed the `Make Move Flow`_ using either method
  up to step 2.

Main Flow
~~~~~~~~~

1. (a) In the case of the *Click Twice method,* the user clicks a
       non-highlighted square.
   (b) In the case of the *Click and Drag method,* the user releases the
       mouse on a non-highlighted square.
2. The system highlights the selected square in **red** and shows the piece
   move back to its original location.

Post-Condition
~~~~~~~~~~~~~~

- The piece is in its original location.
- The *turn marker label* still reads "YOUR TURN."


Resignation Flow
----------------

Precondition
~~~~~~~~~~~~

Main Flow
~~~~~~~~~

Post-Condition
~~~~~~~~~~~~~~


Offer Draw Flow
---------------

Precondition
~~~~~~~~~~~~

Main Flow
~~~~~~~~~

Post-Condition
~~~~~~~~~~~~~~


Replay Moves Flow
-----------------

Precondition
~~~~~~~~~~~~

- The user is in the *In-Game screen*.
- The user wishes to review the moves made in the game from either the
  beginning or from another point in the game history.

Main Flow
~~~~~~~~~

The *Replay Moves Flow*, rather than being a prescribed set of actions, is
instead a user interaction flow based on the user pressing *history
navigation buttons* any number of times and observing the result after each
press.

There are four (4) buttons:

    - **Rewind Fully**: This button rewinds the game back to the start,
      before any moves have been made by either player.
    - **Step Back 1**: This button rewinds the game a single move, as
      defined by one player making a single piece move.
    - **Step Forward 1**: This button forwards the game a single move,
      according to the same definition.
    - **Skip to Most Recent**: This button forwards the game to the most
      recent move made.

The flow is considered to have ended when the user has returned to the most
recent move, either by navigating one move at a time, or by clicking the
**Skip to Most Recent** button.


Post-Condition
~~~~~~~~~~~~~~

- After each button press, the system state should reflect the game at that
  point in its move history.
- If the game cannot move forward or backward because the state is at the
  start or end, the corresponding buttons should be disabled.
- If the game state is not on the most recent move, the system should
  signify how to exit the flow by highlighting the **Skip to Most Recent**
  button.
