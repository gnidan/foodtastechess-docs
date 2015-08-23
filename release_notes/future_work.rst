Future Work
===========

+------+----------------------------------------------------------------------+
|  ID  |                            Description                               |
+======+======================================================================+
|  FW1 | **Redundant Resources and Load Balancing**                           |
|      | We would to make all resources redundant so that our service can     |
|      | scale so instead of 1 client, server, and DB we could divide our     |
|      | services.  Docker containers allow for the services to be installed  |
|      | easily, but the code needs to be altered                             |
+------+----------------------------------------------------------------------+
|  FW2 | **Public Searchable Players Database**                               |
|      | We would like to make it so that you can request a game with any     |
|      | player on the system instead of just the ones that you directly know |
|      | as you never know where good games may come from                     |
+------+----------------------------------------------------------------------+
|  FW3 | **ELO System**                                                       |
|      | In order to have players able to find a worthy oppenent, an ELO      |
|      | would be necessary so that players are able to find those that they  |
|      | can have a good match against                                        |
+------+----------------------------------------------------------------------+
|  FW4 | **Looking for a Game**                                               |
|      | Players sometimes want to play chess, but don't know who, something  |
|      | like this could solict requests to play chess                        |
+------+----------------------------------------------------------------------+
|  FW5 | **Chat Room**                                                        |
|      | Most online games include this feature and implementation would      |
|      | probably be as easy as using a Golang IRC library and using docker   |
|      | to host an IRC server                                                |
+------+----------------------------------------------------------------------+
|  FW6 | **More Games**                                                       |
|      | Our app is fairly malleable and could easily be extend to include    |
|      | support for other online board games like checkers or tic-tac-toe    |
+------+----------------------------------------------------------------------+
