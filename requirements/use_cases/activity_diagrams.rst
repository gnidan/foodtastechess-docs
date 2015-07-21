Activity Diagrams
*****************

Authentication Activity
-----------------------

.. uml::
    start
    :Visit application in browser;
    if (Does user have active session?) then (yes)
    else (no)
        :Click *Login* button;
        :Redirect to Google's OAuth Server|
        :Authenticate with Google;
        :Authorize application to use permissions;
        :Redirect back to application|
    endif

    :Save application session|
    :Show *Lobby Screen*;
    stop


