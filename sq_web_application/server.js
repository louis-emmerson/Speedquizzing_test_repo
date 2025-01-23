const net = require("net");
const port = process.env.PORT || 5500;

const server = net.createServer((socket) => {
    console.log("New connection");

    socket.on("data", (data) => {
        console.log(data.toString());
        server.getConnections((err, count) => {
            if (err) throw err;
            server.connections.forEach((client) => {
                if (client !== socket) {
                    client.write(data);
                }
            });
        });
    });

    socket.on("end", () => {
        console.log("Connection ended");
    });
});

server.listen(port, () => {
    console.log(`TCP server started on port ${port}`);
});