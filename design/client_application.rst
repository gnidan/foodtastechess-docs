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

**Return**
    *Type*
        Link

    *Label*
        "Return to Lobby"

    *Behavior*
        Discard of the new game instance and return the user to the lobby.

**Opponent Selection**
    *Type*
        Single-Line Field

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
        "Random" if they have no preference. If the user chooses "White" or
        "Black" the application will assign the opposing color to the opponent.
        If the user chooses "Random" then the user will be arbitrarilly
        assigned "White" or "Black", and the opponent will be assigned the
        opposing color.

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

