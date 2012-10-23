# Match Maker

A match making game server designed to bring together players based on a weighted set of attributes then offload the rest of the communication to a peer-to-peer communication layer when possible for all the heavy chatter.

---

## Project ideas

1. Connects to database and gets a list of online users (unbounded?)
2. Stores a vector filled with meta data about previous games and connections
3. Offline summations over previous games to cluster players for recommendations (maybe)
4. Weighted decision tree of basic checks between players during each connection (svd?)
	+ Geolocation distance (mercator projection based on lat/lng or lib?)
	+ Previous plays (might need to store some data in a graph)
	+ Latency
	+ Estimated level (could use #3)

---

## Technical Frameworks

#### Node

Using [Node.js][node] primarily for the base server component in this version. It is possible to replace with more tested production systems such as [Eventmachine][em] or [Twisted][td].

#### Coffeescript

All Javascript is written in [Coffeescript][cs].

#### Jasmine

For testing [Jasmine][jas] is used as the [BDD][bdd] testing suite of choice. This might be replaced as more mature Javascript testing frameworks are released.

#### MongoDB

The storage of user related information is stored in [MongoDB][mon] in order to take advantage of the aggregation framework. This is an arbitrary choice based on the thinking that the server will not be selecting all players from a partition who are online and instead grabbing player meta data based on the list of those online. A relational database might be found more efficient in which case the data abstraction layer should be interchangeable.

---

## Project Layout

	* /							#root project directory
	-> /spec					#bdd tests
		-> /models				#data abstraction layer tests
		-> /controllers			#business logic
		-> /views				#response format tests
	-> /log						#development logs stored here (prod goes to logging service)
	-> /config					#configuration files
		-> /locale				#language translations (probably not needed for this)
			-> /{en,eu,es,…}
		-> /environments		#separate configurations for each environment in YAML format
			-> /{development,staging,production}.yml
	-> /app						#base server directory
		-> /models				#data abstraction layer
		-> /controllers			#controller for business logic
		-> /views				#format for the data being returned for each request
	-> packages.json			#npm packages required to run project

---

## Getting Started

In order to run the project the required libraries need to be installed.

Installation of required [NPM][npm] packages can be installed by running ```npm install``` from the base project directory.

Once the required libraries are installed the server can be run with the command ```mongod``` which will also start [MongoDB][mon] on your local system.

Tests can be run with the command ```jasmine-node``` then opening up the test output URL.

##### Overview

```bash

	# install node.js
	cd /home/user/projects/match-maker
	npm install
	jasmine-node
	mongod
	node app/server.coffee

```

[node]: http://nodejs.org/
[em]: http://rubyeventmachine.com/
[td]: http://twistedmatrix.com/
[cs]: http://coffeescript.org/
[jas]: http://pivotal.github.com/jasmine/
[bdd]: http://en.wikipedia.org/wiki/Behavior-driven_development
[mon]: http://www.mongodb.org/
[npm]: https://npmjs.org/