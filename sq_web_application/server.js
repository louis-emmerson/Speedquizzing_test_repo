const WebSocket = require("ws");
const port = process.env.PORT || 5500;
const server = new WebSocket.Server({ port: port });

console.log(`WebSocket server started on port ${port}`);

server.on("connection", (socket) => {
    console.log("New connection");
    
    socket.on("message", (msg) => {
        console.log(JSON.parse(msg));
        server.clients.forEach((client) => {
        if (client.readyState === WebSocket.OPEN) {
            client.send(msg);
        }
        });
    });
});