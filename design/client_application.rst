Client Application
==================

Login Screen
````````````
    This screen allows the user to access the application using their Google
    authentication credentials. This screen is bypassed if the user is already
    logged in using their Google credentials using their browser or via an
    authentication cookie. Successful authentication will take the user to the
    **Lobby Screen**.

**Google Login**
    *Type*
        Google Sign-In authentication button

    *Label*
        "Sign in using Google"

    *Behavior*
        Open sign-in authentication popup, which calls Google's OAuth
        authentication API. Successful authentication is captured and moves the
        user to the **Lobby Screen**.

Lobby Screen
````````````
    This screen presents the user with all chess game instances that are
    completed and in progress. There is also an option to create a new game
    instance.

**New Game**
    *Type*
        Button

    *Label*
        "New Game"

    *Behavior*
        Take the user to the **New Game Screen**.

**Game List**
    *Description*
        A columnar aggregated list of **Game Instance Buttons**. The list is
        divided into two sections: "In-Progress Games" and "Completed Games".
        All game instances are queried as *Games* from the server.

    *Behavior*
        List currently in-progress games, if any, in descending order by most
        recent activity as **Game Instance Buttons** in the "In-Progress Games"
        section. Then list completed games, if any, in descending order by
        most recent completion time as **Game Instance Buttons**. If either
        category is empty then the category is populated with a void to
        indicate that it is empty.

**Game Instance Button - In-Progress**
    *Type*
        Game Instance Button

    *Description*
        Display the game instance's time of last action, the opponent's user
        name, and an indicator for whether the user is active (it is currently
        the user's turn) or if the opponent is active (it is not currently the
        user's turn).

    *Behavior*
        Take the user to the **In-Game Screen** corresponding to the game
        instance depicted.

**Game Instance Button - Completed**
    *Type*
        Game Instance Button

    *Description*
        Display the game instance's time of completion, the opponent's user
        name, and an indicator of the game's result (complete-won,
        complete-loss, complete-draw).

    *Behavior*
        Take the user to the **In-Game Screen** corresponding to the game
        instance depicted.

New Game Screen
```````````````
    This screen allows the user to initiate a new game instance.

**Return to Lobby**
    *Type*
        Link

    *Label*
        "Return to Lobby"

    *Behavior*
        Discard of the new game instance and return the user to the lobby.

**Opponent Selection**
    *Type*
        Single-line field

    *Label*
        "Opponent Email Address"

    *Description*
        Check the email address input to verify that the the email address
        input is valid. This is done via a client-side regular expression
        check. The user may not enter their own email address as an opponent,
        and such behavior is considered invalid.

**Color Selection**
    *Type*
        Series of three radio buttons

    *Label*
        "Random", "White", "Black"

    *Description*
        Allow the user to choose if they wish to play as "White", "Black", or
        "Random" if they have no preference.

    *Behavior*
        If the user chooses "White" or "Black" the application will assign the
        opposing color to the opponent. If the user chooses "Random" then the
        user will be arbitrarilly assigned "White" or "Black", and the opponent
        will be assigned the opposing color.

    *Default*
        "Random"

**Submit**
    *Type*
        Button

    *Label*
        "Submit"

    *Description*
        Check that the email address the user input in the **Opponent
        Selection** field is valid. Inform the user if the input is invalid.
        Otherwise, post the new game instance to the server.

In-Game Screen
``````````````
    This screen displays the game's current state graphically with an
    interactive interface that allows the user to manipulate the game state
    appropriately.

**Return to Lobby**
    *Type*
        Link

    *Label*
        "Return to Lobby"

    *Behavior*
        Return the user to the lobby. If a **game piece** on the **game
        board** is in the "active" state the application will present the
        **Return Confirmation** modal dialog.

**Return Confirmation**
    *Type*
        Modal dialog

    *Label*
        "Do you want to discard of your current move and return to the game
        lobby?"

    *Description*
        Contains buttons that offers the user the following choices: "Yes",
        "Cancel"

    *Behavior*
        "Yes" returns the user to the **Lobby Screen** without sending any
        data to the server. "Cancel" closes the return confirmation modal
        dialog.

**Draw Confirmation**
    *Type*
        Modal Dialog

    *Label*
        "Your opponent offered a draw. Would you like to accept?"

    *Description*
        This modal dialog is only shown if the opponent selected to offer a
        draw in the current game. Contains buttons that allow the user to
        choose the following choices: "Accept", "Decline"

    *Behavior*
        "Accept" sets the game state to "complete-draw". "Decline" closes the
        dialog.

**Game Board**
    *Description*
        The current game state is shown graphically as a chess board. The
        board is oriented such that square A-1 is in the lower left corner if
        the user is playing as White, or square G-8 is in the lower left
        corner if the user is playing as Black. The game board aggregates
        **Game Pieces** in their appropriate positions on the board.

    *Label*
        The game board is labeled along its edges with the positional notation
        coordinates corresponding to the appropriate files and ranks ("A"
        through "G" and "1" through "8" respectively).

    *Behavior*
        If a **game piece** is currently active and can move, all squares that
        the piece can move to are highlighted. Clicking on one of these
        squares moves the piece to the chosen square and deactivates the
        active game piece. If a piece is activated by dragging, then dropping
        the active piece moves the piece to the chosen square and deactivates
        the piece. If movement involves capturing a piece then the captured
        piece is removed from the game board and the **Captured Pieces**
        display is updated. All move validity is defined by an array of valid
        moves provided by the server.

**Game Piece**
    *Description*
        Each game piece that is currently active is displayed graphically
        using a distinctive icon depicting the piece's type and color.

    *Behavior*
        Clicking on a piece activates that piece. A border surrounds an active
        piece to make it stand out. Dragging a piece activates the piece
        similarly. Active piece movement behavior is defined by the **game
        board**. If a piece has been moved then it is considered "moved".
        There will only be one "moved" piece at a time. Selecting a moved
        piece activates that piece and allows the user to move it to a valid
        square or to its original position. If the piece is return to its
        original position it is considered "inactive".

    *Default*
        All pieces are in the "inactive" state by default.

**Promotion Dialog**
    *Type*
        Modal dialog

    *Description*
        This dialog is presented to the user if pawn promotion is available.
        Buttons with each of the possible promotion pieces are displayed
        (rook, bishop, knight, queen).

    *Behavior*
        Selecting a promotion piece replaces the corresponding moved pawn
        piece with the appropiate promotion piece. The promotion piece is then
        considered to be the "moved piece".

**Game Banner**
    *Description*
        Displays "Your turn" or "Opponent's turn" appropriately.

**Captured Pieces**
    *Label*
        "Captured Pieces"

    *Description*
        The captured pieces block is divided vertically into two sections, the
        left designated for white and the right for black. Chess pieces that
        have been captured during the game are shown in the appropriate
        section. Pieces are ordered by piece priority.

**Navigation Bar**
    *Description*
        Aggregates the **navigation buttons**.

**Navigation Button**
    *Label*
        Graphic depictions of forwards and backwards movement resembling media
        control icons.

    *Description*
        Four buttons indicating full reverse, back, forward, and full forward.

    *Behavior*
        Selecting any button other than full forward puts the game into
        tracking state. In this state the user can not interract with the
        **Game Board**. The navigation buttons are used to scrub the game's
        history. The full reverse button shows the game in its initial state.
        The back button shows the game in its previous state. The forward
        button shows the game in its next state if the game is in a tracking
        state. The full forward button takes the game out of tracking state
        and shows the game in its current state.

**Game History**
    *Description*
        A scrollable list of the moves made in the current game in sequential
        order, in algebraic chess notation.

    *Behavior*
        Selecting any move other than the most recent move puts the game board
        in tracking state. Navigation works similarly to the **Navigation
        Bar**. Selecting the most recent move takes the game out of tracking
        state.

**Offer Draw**
    *Type*
        Button

    *Label*
        "Offer Draw"

    *Behavior*
        Brings up the **confirm draw offer** modal dialog.

**Confirm Draw Offer**
    *Type*
        Modal Dialog

    *Label*
        "Do you want to offer your opponent a draw?"

    *Description*
        Provide the user with options: "Yes", "No"

    *Behavior*
        "Yes" posts a draw offer to the server. "No" closes the modal dialog.

**Concede**
    *Type*
        Button

    *Label*
        "Concede Game"

    *Behavior*
        Brings up the **Confirm Concession** modal dialog.

**Confirm Concession**
    *Type*
        Modal Dialog

    *Label*
        "Do you want to concede this game?"

    *Description*
        Provide the user with options: "Yes", "No"

    *Behavior*
        "Yes" sets the game state to "complete-loss" and posts this state to
        the server. "No" closes the modal dialog.

**Toggle Manual Move Confirmation**
    *Type*
        Toggle checkbox

    *Label*
        "Manually confirm moves"

    *Behavior*
        When the checkbox is selected the user must manually confirm all moves
        before they are posted to the server. Otherwise, the move is sent once
        a valid move has been made.

    *Default*
        On

**Toggle Valid Move Highlighting**
    *Type*
        Toggle checkbox

    *Label*
        "Highlight valid moves"

    *Behavior*
        When the checkbox is selected if a user activates a **game piece** on
        the **game board** the game board will highlight all valid moves that
        the current active piece can make. Otherwise it does not highlight.

    *Default*
        On

