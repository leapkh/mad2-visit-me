import 'package:flutter/material.dart';

void main() {
  // Build an app (tree of widget)

  //            Last Level: Control
  final txtHelloWorld = Text(
    'Hello World!',
    style: TextStyle(color: Colors.purple),
  );
  final txtGreeting = Text("Welcome to ITE!");

  final icon = Icon(
    Icons.saved_search,
    size: 128,
    color: Colors.blue,
  );

  //        Level 2: Layout/Block

  final row = Row(
    children: [
      txtHelloWorld,
      icon,
    ],
  );

  //final body = Center(child: txtHelloWorld);
  final column = Column(
    // mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [row, txtGreeting],
  );

  final center = Center(
    child: column,
  );

  //    Level 1: HomeScreen
  final homeScreen = Scaffold(
    body: column,
  );

  // Level 0: App
  final app = MaterialApp(
    home: homeScreen,
  );

  //    - DetailScreen
  //    - ProfileScreen

  // Run the app

  runApp(app);
}
