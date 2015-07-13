Non-Functional Requirements
===========================

Accessibility
-------------

- Users with an internet connection may access the web application
- This web application should be usable by those who are colorblind
- This web application should allow ample time for those with mobility impairment
- This web application will show available moves to those who need it
- This web application should comply with web standards of accessibilty

Availability
------------

- This web application will be online for as long as the duration of the term

Dependency on other parties
---------------------------

- This web application should be independent of dependencies that are not of docker or the go language

Deployment
----------

- This web application will deploy on docker for each component
- This web application will be continously deployed from github

Extensibilty
------------

- This web application should prepare for versions past 1.0 and should be coded with simple, numerous functions

Fault Tolerance
---------------

- This web application will after 1.0 will allow multiple servers to handle incoming data
- This web application for the forseeable future only have one database server
- This web application should be independent from the clients

Licensing
---------

- This web application will be released with MIT licensing

Maintainability
---------------

- This web application should be written in idiom and simple language so that it may be maintained
- This web application should have simple functions
- This web application should provide proper logging
- This web application should use modules to allow for future upgrades

Network Topology
----------------

- This web application should consist of a client, server, and database
- The server and database should be on the same subnet
- The client may connect from any IP address

Open Source
-----------

- This web application will be released as open source under the MIT license at the conclusion of the project

Performance
-----------

- This web application should support at least 50 moves a second
    - Including validation and database update
- The client should not appear to experience any latency

Platform
--------

- This web applacation and all of its parts will run in docker

Price
-----

- This web applacation will be free


Privacy
-------

- This web applacation will not release personal information to third parties

Portability 
-----------

- This web application will not be taking different run-time enviroments into account as it will run in docker, an industry standard

Quality
-------

- This web application should not ship with any known bugs that cause crashing

Recoverability
--------------

- This web application should be able to easily recover from crashing and resume the last known game state

Reliabilty
----------

- This web application should not ship with any known defects that cause to be less reliable

Response Time
-------------

- This web application should return results in under a second

Reusability
-----------

- This web application should be built in a modular nature to allow for reuse of its components

Robustness
----------

- This web application should not crash from minor errors

Scability
---------

- This web application should not prioritize scalability with the release of 1.0

Security
--------

- This web application will not be responsible will not be responsible for its own authentication
- This web application will rely on Google for its security

Supportability
--------------

- This web application should have clear code that can be supported after release
- This web application will not be maintained after release

Testability
-----------

- This web application and its many parts should be highly modular and allow for testing each module independently

Usability
---------

- This web application should have a one command initialization 
- This web application should be able to be run with only docker installed on the host machine

User Friendliness
-----------------

- This web application should use web standards in order to provide an uninterupped user experience
