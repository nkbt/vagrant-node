var http = require('http');
var fs = require('fs');
var socketIo = require('socket.io');

var server = http.createServer(function handler(req, res) {
    fs.readFile(__dirname + '/index.html',
        function (err, data) {
            if (err) {
                res.writeHead(500);
                return res.end('Error loading index.html');
            }

            res.writeHead(200);
            return res.end(data);
        });
});
server.listen(3000);

var io = socketIo.listen(server);

io.sockets.on('connection', function (socket) {
    socket.emit('ping', (new Date()).toJSON());
    socket.on('get-ping', function(message) {
        socket.emit('ping', (new Date()).toJSON());
    })
});


