FoodtasteChess Install Guide
============================

Getting Started
---------------

 - Please make sure that you are not currently running a web server on port 80.
 - Install docker onto your machine and be in the docker group

The install
-----------
 Clone the repos into somewhere reasonable:
	1. cd ~
	2. mkdir project
	3. git clone git@github.com:gnidan/foodtastechess.git
	4. git clone git@github.com:gnidan/foodtastechess-client.git
	5. git clone git@github.com:gnidan/foodtastechess-config.git
	6. source foodtastechess-config/bin/activate
	7. vi foodtastechess-config/config/nginx/nginx.conf and change doneit.cs.drexel.edu to be your hostname	

Running the Project
-------------------
Run the command: docker-compose up

The project is now running and you may visit {Your hostname}/auth to log-in
