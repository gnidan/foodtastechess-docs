FoodtasteChess Install Guide
============================

Getting Started
---------------

 - Please make sure that you are not currently running a web server on port 80.
 - Install docker onto your machine and be in the docker group
		1. sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"

		2. sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\ > /etc/apt/sources.list.d/docker.list"
		3. aptitude install lxc-docker
		4. sudo gpasswd -a ${USER} docker
		5. pip install docker-compose
		6. Logout and log back in, to refresh your groups

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
	8. vi foodtastechess/config.yml and add localhost:80/auth/callback to the auth/callback line
	9. Change the bind address to also be port 80

Running the Project
-------------------
Run the command: docker-compose up

The project is now running and you may visit {Your hostname}/auth to log-in
