import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SpeedQuizzing',
      home: MyHomePage(title: 'SpeedQuizzing Test App!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebSocketChannel channel;

  final msgTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _connectSocket();
  }

  void _connectSocket() {
    channel = WebSocketChannel.connect(Uri.parse('ws://192.168.4.187:5500'));

    channel.stream.listen(
      (message) {
        print('Message received: $message');
      },
      onDone: () {
        print('Connection closed');
      },
      onError: (error) {
        print('Error: $error');
      },
    );
  }

  void _updateColor(String color) {
    final jsonData = jsonEncode({"color": color});
    channel.sink.add(jsonData);
  }

  void _sendTextMsg(String msg) {
    final msgData = jsonEncode({"message": msg});
    channel.sink.add(msgData);
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => _updateColor("red"),
              child: const Text(
                "Red",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () => _updateColor("blue"),
              child: const Text(
                "Blue",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => _updateColor("green"),
              child: const Text(
                "Green",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5, top: 20),
              child: TextField(
                controller: msgTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a message to send to web app',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => {_sendTextMsg(msgTextController.text)},
              child: const Text("Send Message"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    "Color from web app",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: const BoxDecoration(color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
