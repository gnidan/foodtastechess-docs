Non-Functional Requirements
===========================

Accessiblity
------------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  AC1 | Internet        | Users with  | 1. Connect to   | Log-in screen    | Correct        | App is   |
|      | Connection      | an internet |    app via      | is presented     |                | on the   |
|      |                 | connection  |    Internet     |                  |                | internet |
|      |                 | may access  |                 |                  |                |          |
|      |                 | the web app |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  AC2 | Mobility        | This web    | 1. Play a game  | Moves can take   | Yes, there is  |          |
|      | Impairment      | app should  |                 | as long as       | no clock       |          |
|      |                 | allow ample |                 | needed           |                |          |
|      |                 | time for    |                 |                  |                |          |
|      |                 | moves to    |                 |                  |                |          |
|      |                 | those with  |                 |                  |                |          |
|      |                 | mobility    |                 |                  |                |          |
|      |                 | impairment  |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  AC3 | Available to    | This web    | 1. Click on     | View all valid   | Moves are      |          |
|      | Players of all  | app will    |    piece        | moves            | shown          |          |
|      | skill levels    | show        |                 |                  |                |          |
|      |                 | available   |                 |                  |                |          |
|      |                 | moves to    |                 |                  |                |          |
|      |                 | everyone    |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Availability
------------


+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
| AV1  | Availability    | This web    | 1. Attempt to   | Is it within the | Term is not    |          |
|      |                 | app will be |    connect      | term?            | over yet, it   |          |
|      |                 | online for  |                 |                  | is up          |          |
|      |                 | the         |                 |                  |                |          |
|      |                 | duration of |                 |                  |                |          |
|      |                 | the term    |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Dependency
----------


+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  DE1 | Independence    | This web    | 1. Find depend. | Docker and       | Nodejs and     | Don't    |
|      |                 | app should  |    of app       | golang only      | other tools    | reinvent |
|      |                 | be          |                 |                  | were used      | wheel    |
|      |                 | independent |                 |                  |                |          |
|      |                 | of depend.  |                 |                  |                |          |
|      |                 | that are    |                 |                  |                |          |
|      |                 | not of      |                 |                  |                |          |
|      |                 | docker or   |                 |                  |                |          |
|      |                 | golang      |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Deployment
----------


+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  DP1 | Docker Use      | This web    | 1. Run app      | This app runs    | Correct        |          |
|      |                 | app will    |                 | completely on    |                |          |
|      |                 | deploy on   |                 | docker           |                |          |
|      |                 | docker for  |                 |                  |                |          |
|      |                 | each        |                 |                  |                |          |
|      |                 | component   |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Fault Tolerance
---------------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  FT1 | Multiple Server | This web    | 1. Start        | Handled as if    | 1.0 is the end |          |
|      |                 | app will    |    another      | one server       | of class       |          |
|      |                 | after 1.0   |    instance     |                  |                |          |
|      |                 | will allow  |                 |                  |                |          |
|      |                 | multiple    |                 |                  |                |          |
|      |                 | servers to  |                 |                  |                |          |
|      |                 | handle      |                 |                  |                |          |
|      |                 | incoming    |                 |                  |                |          |
|      |                 | data        |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  FT2 | One DB          | This web    | 1. Attempt to   | Only one DB      | Not needing to |          |
|      |                 | app for the |    write to     | should work      | be tested      |          |
|      |                 | forseeable  |    another DB   |                  |                |          |
|      |                 | future only | 2. Find errors  |                  |                |          |
|      |                 | have one    |    in data      |                  |                |          |
|      |                 | database    |                 |                  |                |          |
|      |                 | server      |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  FT3 | Independence    | This web    | 1. Spin up many | All write to     | Not tested     | Only one |
|      |                 | app should  |    server       | same DB, unless  |                | Server   |
|      |                 | be          |    containers   | game is open     |                |          |
|      |                 | independent |                 | on multiple      |                |          |
|      |                 | from the    |                 | servers, it is   |                |          |
|      |                 | clients     |                 | not a problem    |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Licensing
---------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  LI1 | MIT             | This web    | 1.  Release it  | Expands the      | No one really  | :(       |
|      |                 | app will be |     with MIT    | world's          | looks at it    |          |
|      |                 | released    |     Licensing   | knowledge        |                |          |
|      |                 | with MIT    |                 |                  |                |          |
|      |                 | licensing   |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Maintainability
---------------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  MA1 | Logging         | This web    | 1. Implement    | Apps log         | It logs        |          | 
|      |                 | app should  |    logging      |                  |                |          |
|      |                 | provide a   | 2. Use it       |                  |                |          |
|      |                 | level of    |                 |                  |                |          |
|      |                 | logging     |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  MA2 | Modular         | This web    | 1. Have         | Modular code     | Code is        |          |
|      |                 | app should  |    modules      |                  | modular        |          |
|      |                 | be highly   |    exist alone  |                  |                |          |
|      |                 | modular to  |    in separate  |                  |                |          |
|      |                 | allow for   |    directories  |                  |                |          |
|      |                 | future      |                 |                  |                |          |
|      |                 | upgrades    |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Network Topology
----------------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  NT1 | Components      | This web    | 1. Docker ps    | Client, server,  | Extra comps    |          |
|      |                 | app should  |    to view      | and database     | such as nginx  |          |
|      |                 | consist of  |    components   |                  | as a docker    |          |
|      |                 | a client,   |                 |                  | container and  |          |
|      |                 | server, and |                 |                  | the physical   |          |
|      |                 | database    |                 |                  | datastore      |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  NT2 | Subnet          | The server  | 1. Find the     | Same subnet      | They are       | Same     |
|      |                 | and db      |    docker comps |                  |                | Machine  |
|      |                 | should be   |                 |                  |                |          |
|      |                 | on the same |                 |                  |                |          |
|      |                 | subnet      |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  NT3 | Open to         | The client  | 1. Connect to   | Access           | No restriction |          |
|      | Internet        | may connect |    app with a   |                  | place on app   |          |
|      |                 | from any IP |    wide range   |                  | yet            |          |
|      |                 | address     |    of IP        |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Open Source
-----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  OS1 | Release Terms   | This web    | 1. Release on   | See LI1                                      |
|      |                 | app will be |    Github as    |                                              |
|      |                 | released as |    public with  |                                              |
|      |                 | open source |    MIT license  |                                              |
|      |                 | under the   |                 |                                              |
|      |                 | MIT license |                 |                                              |
|      |                 | at the      |                 |                                              |
|      |                 | conclusion  |                 |                                              |
|      |                 | of the      |                 |                                              |
|      |                 | project     |                 |                                              |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Performance
-----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  PE1 | Move Frequency  | This web    | 1. Lots of      | If less than 50  | Correct for    |          |
|      |                 | app should  |    moves        | moves/second,    | current volume |          |
|      |                 | support at  |    directed at  | then it should   |                |          |
|      |                 | least 50    |    server       | be fine          |                |          |
|      |                 | moves a     |                 |                  |                |          |
|      |                 | second      |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  PE2 | Latency         | The client  | 1. Standard     | No unexplained   | Correct for    |          |
|      |                 | should not  |    client       | slowdowns        | current volume |          |
|      |                 | appear to   |    usage        |                  |                |          |
|      |                 | experience  |                 |                  |                |          |
|      |                 | any latency |                 |                  |                |          |
|      |                 | in excess   |                 |                  |                |          |
|      |                 | of 1000 ms  |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+


Platform
--------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  PL1 | Docker usage    | This web    | 1. Run app      | Everything runs  | Everything     |          |
|      |                 | app and all |                 | in docker        | runs in docker |          |
|      |                 | of its      |                 |                  |                |          |
|      |                 | parts will  |                 |                  |                |          |
|      |                 | run in      |                 |                  |                |          |
|      |                 | docker      |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Price
-----

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  PR1 | Price           | This web    | 1. Release app  | It does not cost | It's free      |          |
|      |                 | app will be |                 | money            |                |          |
|      |                 | free        |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Privacy
-------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
| PI1  | Privacy         | This web    |                                                     | Don't be |
|      |                 | app will    |                                                     | evil     |
|      |                 | not release |                                                     |          |
|      |                 | personal    |                                                     |          |
|      |                 | information |                                                     |          |
|      |                 | to third    |                                                     |          |
|      |                 | parties     |                                                     |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Portability
-----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  PO1 | Run-time        | This web    |                                                     | Never    |
|      | Enviroments     | app will    |                                                     | intended |
|      |                 | not be      |                                                     | to run   |
|      |                 | taking      |                                                     | in       |
|      |                 | different   |                                                     | anything |
|      |                 | run-time    |                                                     | else     |
|      |                 | enviroments |                                                     |          |
|      |                 | into        |                                                     |          |
|      |                 | account as  |                                                     |          |
|      |                 | it will run |                                                     |          |
|      |                 | in docker   |                                                     |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Quality
-------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  Q1  | Bug-free        | This web    |                                                     |          |
|      |                 | app should  |                                                     |          |
|      |                 | not ship    |                                                     |          |
|      |                 | with any    |                                                     |          |
|      |                 | known bugs  |                                                     |          |
|      |                 | that cause  |                                                     |          |
|      |                 | crashing    |                                                     |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Recoverability
--------------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  RE1 | Recover from    | This web    | See RS2                                                        |
|      | crash           | app should  |                                                                |
|      |                 | be able to  |                                                                |
|      |                 | easily      |                                                                |
|      |                 | recover     |                                                                |
|      |                 | from        |                                                                |
|      |                 | crashing    |                                                                |
|      |                 | and resume  |                                                                |
|      |                 | the last    |                                                                |
|      |                 | known game  |                                                                |
|      |                 | state       |                                                                |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Reliability
-----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  RB1 | Reliability     | This web    | See Q1                                                         |
|      |                 | app should  |                                                                |
|      |                 | not ship    |                                                                |
|      |                 | with any    |                                                                |
|      |                 | known       |                                                                |
|      |                 | defects     |                                                                |
|      |                 | that cause  |                                                                |
|      |                 | to be less  |                                                                |
|      |                 | reliable    |                                                                |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Response Time
-------------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
| RT1  | Time allowance  | This web    | 1. Query server | Handles it fine  | Correct        |          |
|      |                 | app should  |    continually  |                  |                |          |
|      |                 | return      |                 |                  |                |          |
|      |                 | results in  |                 |                  |                |          |
|      |                 | under a     |                 |                  |                |          |
|      |                 | second      |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Reusability
-----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  RU1 | Modularity      | This web    | See MA2                                                        |
|      |                 | app should  |                                                                |
|      |                 | be built    |                                                                |
|      |                 | with many   |                                                                |
|      |                 | modules to  |                                                                |
|      |                 | allow for   |                                                                |
|      |                 | reuse of    |                                                                |
|      |                 | its         |                                                                |
|      |                 | components  |                                                                |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Robustness
----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  RO1 | Crash Resistant | This web    | See Q1                                                         |
|      |                 | app should  |                                                                |
|      |                 | not crash   |                                                                |
|      |                 | from minor  |                                                                |
|      |                 | errors      |                                                                |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Scalability
-----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  SC1 | Scalability     | This web    |                                                     | This is  |
|      |                 | app should  |                                                     | not a    |
|      |                 | not         |                                                     | priority |
|      |                 | prioritize  |                                                     |          |
|      |                 | scalability |                                                     |          |
|      |                 | with the    |                                                     |          |
|      |                 | release of  |                                                     |          |
|      |                 | 1.0         |                                                     |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Security
--------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  SE1 | Authentication  | This web    |                                                                |
|      |                 | app will    |                                                                |
|      |                 | not be      |                                                                |
|      |                 | responsible |                                                                |
|      |                 | for its own |                                                                |
|      |                 | auth        |                                                                |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  SE2 | Google Auth     | This web    | See L1                                                         |
|      |                 | app will    |                                                                |
|      |                 | rely on     |                                                                |
|      |                 | Google for  |                                                                |
|      |                 | its         |                                                                |
|      |                 | security    |                                                                |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Supportability
--------------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  SU1 | After Release   | This web    | 1. Release      | No maintainence  | We'll see      |          |
|      |                 | app will    | 2. Find time to |                  |                |          |
|      |                 | not be      |    work on it   |                  |                |          |
|      |                 | maintained  |                 |                  |                |          |
|      |                 | after       |                 |                  |                |          |
|      |                 | release     |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Testability
-----------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  TE1 | Unit Tests      | This web    | 1. Run unit     | If they pass app | Unit test      |          |
|      |                 | app and its |    tests        | should be good   | passed         |          |
|      |                 | many parts  |                 | to go            |                |          |
|      |                 | should be   |                 |                  |                |          |
|      |                 | highly      |                 |                  |                |          |
|      |                 | modular and |                 |                  |                |          |
|      |                 | allow for   |                 |                  |                |          |
|      |                 | testing     |                 |                  |                |          |
|      |                 | each module |                 |                  |                |          |
|      |                 | independent |                 |                  |                |          |
|      |                 | of one      |                 |                  |                |          |
|      |                 | another     |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+

Usability
---------

+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  ID  | Test Desciption | Requirement | Execution Steps | Expected Results | Actual Results | Comments |
+======+=================+=============+=================+==================+================+==========+
|  US1 | One command     | This web    | 1. Attempt to   | One command      | Several clones | Easy to  |
|      | init            | app should  |    spin up new  |                  | and a docker   | make one |
|      |                 | have a one  |    instance     |                  | command        | command  |
|      |                 | command     |                 |                  |                |          |
|      |                 | init        |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
|  US2 | Only docker     | This web    | 1. Attempt to   | Only docker is   | Correct        |          | 
|      | Installed       | app should  |    spin up new  | needed           |                |          |
|      |                 | be able to  |    instance     |                  |                |          |
|      |                 | be run with |                 |                  |                |          |
|      |                 | only docker |                 |                  |                |          |
|      |                 | installed   |                 |                  |                |          |
|      |                 | on the host |                 |                  |                |          |
|      |                 | machine     |                 |                  |                |          |
+------+-----------------+-------------+-----------------+------------------+----------------+----------+
