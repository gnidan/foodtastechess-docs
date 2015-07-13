Specific Requirements
=====================

Functional Requirements
-----------------------

Web Application
~~~~~~~~~~~~~~~

Login Screen
````````````
- The application will allow the user to log in using a Google account.
- If the user is already logged in to a Google account within their browser they will be taken to a verification page.
- If the user's Google account is properly authenticated the application will take the user to the Lobby Screen.
- Once the user is authenticated the user's Google username is displayed in the top right corner of all subsequent screens. This will act as a link via which the user may log out.

Lobby Screen
````````````
- The application displays a list of all games that the user is currently playing and all completed games in which the user has participated.
- For each game the application provides the opponent's name, a token string, and the game's state (user-turn, opponent-turn, complete-won, complete-loss, complete-draw).
- The user may choose a game which will present them with a In-Game Screen corresponding to that game.
- The application provides an option for the user to create a new game, which will take the user to the New Game Screen.

New Game Screen
```````````````
- The application allows a user to choose whether they wish to play black, white, or no preference (defaults no preference).
- The application allows the user to invite another user to play as the opponent.
- The application provides a button that creates the new game instance and takes the user to an In-Game Screen of the new game.

In-Game Screen
```````````
- If the user is viewing a completed game the application displays a modal dialogue with the final game state.
- If the user enters the In-Game Screen while they are in check the application displays a modal dialogue informing them of the check state.
- The application displays a game board that represents the current game state.
    - All components of the game board behave in a way defined by the rules of chess.
    - The game board displays the chess board, the user's game pieces, and the opponent's game pieces.
        - The chess board is of two distinct colors, with chess algebraic notation markings along the board's perimeter.
    - The user may move a piece if it is their turn.
        - The user may click on a piece to activate it. They may then click on a valid square on the chess board to move the piece to that square.
        - The user may drag a piece (which activates it) and drop in on a valid square.
        - If a piece is activated the valid squares to which the piece may be moved are highlighted. Validity is determined by the rules of chess.
        - If an activated piece is placed on a valid square then it is deactivated, and the user may not move another piece.
        - If the user captures an enemy piece the enemy piece is removed from the board and added to the captured zone.
        - If the user castles their king then the appropriate rook will move to its valid location.
        - The user may click on a confirmed piece. The application will then provide a modal dialogue that allows the user to confirm or take back their move.
        - If the user takes back a move before confirming, the game's state is returned to how it was before the user made their last move.
    - The user may not directly interact with the board if it is not their turn.
    - Once a game instance has been completed the game's state will enter one of complete-won, complete-loss, or complete-draw.
    - A user can not interact with the game board if the game is in any complete state.
- If the opponent transfers control of the game to the user (either by making a move or offering a draw) the user regains control of the game board.
- If the opponent offers a draw the application will display a modal dialogue asking if the user wants to accept the draw.
    - The user may accept the draw, which will set the game's state to complete-draw.
    - Otherwise, the user decline the draw offer, which will close the dialogue.
- The application will inform the player if the opponent does not accept a user's offer for a draw.
- If the application finds that the game is in a state of completion at any time it will inform the user of the final game state.
- The application displays a banner informing a user if it is the user's move or the opponent's move.
- The application displays all captured pieces, divided by color.
- The application provides a navigation bar that allows the user to page through previous moves.
    - The navigation bar consists of a full reverse, a back button, a forward button, and a full forward button.
    - Selecting any button other than the full forward button will lock the game state and change to a tracking state, regardless of who is the active player. This will prevent the user from interacting with the board.
    - If the user is viewing the game in its initial state the application will make the full reverse and back buttons darkened and nonfunctional. Likewise, if the user is viewing the current game state the forward and full forward buttons are darkened and nonfunctional.
    - The full reverse button makes the game board appear as it did at the beginning of the game.
    - The back button makes the game board appear as it did in the tracking state's previous move.
    - The forward button makes the game board appear as it will in the tracking state's next move.
    - The full forward button will make the game appear as it does in the current game state, and will switch the game board from a tracking state to the game state.
    - If the application is in tracking state while the opponent makes a move, a modal dialogue will appear offering the user the ability to return to the active game state.
- The application provides a scrollable window that displays the game's moves in chess algebraic notation.
    - The user may select any move from this window. This will put the game in tracking mode and will display the game in the tracking state corresponding to the move that the user selected.
- The application provides a button that toggles manual move confirmation (on by default).
    - The button will indicate wether manual move confirmation is activated using a check box.
- The application provides a button that toggles highlighting valid moves (on by default).
    - The button will indicate wether manual move confirmation is activated using a check box.
- The application provides a button that allows the user to concede the game.
    - If the user selects this button the application will present a modal dialogue requesting the user to confirm their selection.
        - The user may accept the concession at this dialogue, which will set the game's state to complete-loss.
        - Otherwise, not confirming at this dialogue will close the modal dialogue.
- The application provides a button that allows the user to offer a draw to their opponent.
- The application provides a button that allows the user to return to the Lobby Screen.

