net = require 'net'

# Not the real server
server = net.createServer -> (socket)
  socket.write 'Listening\r\n'
  socket.pipe socket

server.listen 8080, '127.0.0.1'
