import 'package:flutter/material.dart';
import 'package:visit_me/place.dart';
import 'package:visit_me/screen/place_detail_screen.dart';
import 'package:visit_me/screen/search_screen.dart';

void main() {
  runApp(app());
}

Widget app() {
  return MaterialApp(
    home: PlaceDetailScreen(),
  );
}

