# Match Maker

A match making game server designed to bring together players based on a weighted set of attributes then offload the rest of the communication to a peer-to-peer communication layer when possible for all the heavy chatter.

---

## Technical Frameworks

#### Node

Using [Node.js][node] primarily for the base server component in this version. It is a slightly unstable production server yet it has a great deal of trending usage and for most cases works quite well. It is possible to replace with more tested production systems such as [Eventmachine][em] or [Twisted][td].

Any of these systems should give a good evented framework which can easily be communicated between experienced developers and does not require detailed insider information to maintain.

#### Coffeescript

All Javascript is written in [Coffeescript][cs] because it protects from some novice Javascript mistakes. It is also fun to write and the generated Javascript is of a good quality.

[EMCA 6][emca] includes classes yet [v8][v8] does not support it yet.

#### Jasmine

For testing [Jasmine][jas] is used as the [BDD][bdd] testing suite of choice. This might be replaced as more mature Javascript testing frameworks are released.

#### MongoDB

The storage of user related information is stored in [MongoDB][mon] in order to take advantage of the aggregation framework. This is an arbitrary choice based on the thinking that the server will not be selecting all players from a partition who are online and instead grabbing player meta data based on the list of those online. A relational database might be found more efficient in which case the data abstraction layer should be interchangeable.

---

## Project Layout

	* /							#root project director
	-> /spec					#bdd tests
		-> /models				#data abstraction layer tests
		-> /controllers			#business logic
		-> /views				#response format tests
	-> /log						#development logs stored here (prod goes to logging service)
	-> /config					#configuration files
		-> /environments		#separate configurations for each environment in YAML format
			-> /{development,staging,production}.yml
	-> /app						#base server directory
		-> /models				#data abstraction layer
		-> /controllers			#controller for business logic
		-> /views				#format for the data being returned for each request
	

[node]: http://nodejs.com
[haml]: http://haml.com
[em]: http://eventmachine.com
[td]: http://twisted.com
[cs]: http://coffeescript.org
[emca]: http://emca.org
[v8]: http://v8.com
[jas]: http://jasmine.com
[bdd]: http://bdd.com
[mon]: http://mongo.com