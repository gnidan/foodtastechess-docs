Introduction
============

FoodTasteChess is a web application that allows for a user to connect with their Google Account to our application.  With this application users may play chess with other users online and invite their friends.  FoodTasteChess features an easy to use API and allows for custom clients to access the their own games and play them in alternative formats.  The client is wholly node.js and has none of the game logic, while the server is in golang and is the brains of the operation.  Games are kept in an active database until they expire when they are inactive, then they are stored in a static database.
