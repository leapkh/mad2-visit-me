import 'package:flutter/material.dart';
import 'package:visit_me/place.dart';
import 'package:visit_me/screen/home_screen.dart';
import 'package:visit_me/screen/place_detail_screen.dart';
import 'package:visit_me/widget/search_widget.dart';

void main() {
  runApp(app());
}

Widget app() {
  return MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
  );
}

