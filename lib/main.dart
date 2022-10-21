import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

Widget app() {
  return MaterialApp(
    home: placeDetailScreen(),
  );
}

Widget homeScreen() {
  final border = Border.all(
    color: Colors.red,
    width: 4,
  );
  final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey,
      border: border);

  final margin = EdgeInsets.all(16);

  final container = Container(
    width: 100,
    height: 100,
    decoration: decoration,
    margin: margin,
  );

  final container2 = Container(
    width: 200,
    height: 200,
    color: Colors.purple,
  );

  final column = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      container,
      container2,
    ],
  );

  return Scaffold(
    body: column,
  );
}

Widget placeDetailScreen() {
  final body = Column(
    children: [
      topWidget(),
      menuWidget(),
      descriptionWidget(),
    ],
  );

  return Scaffold(
    body: body,
  );
}

Widget topWidget() {
  return Container(
    height: 300,
    color: Colors.grey,
  );
}

Widget menuWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      menuItemWidget('About', isActive: true),
      menuItemWidget('Photos'),
      menuItemWidget('Reviews'),
    ],
  );
}

Widget menuItemWidget(String title, {bool isActive = false}) {
  final border = Border.all(color: Colors.green);
  final radius = BorderRadius.circular(18);
  final backgroundColor = isActive ? Colors.white : Colors.green;
  final textColor = isActive ? Colors.green : Colors.white;
  final decoration = BoxDecoration(
      border: border, borderRadius: radius, color: backgroundColor);
  final padding = EdgeInsets.symmetric(horizontal: 16);
  final margin = EdgeInsets.all(8);

  final textStyle = TextStyle(color: textColor);
  final titleWidget = Text(
    title,
    style: textStyle,
  );

  return Container(
    alignment: Alignment.center,
    height: 36,
    child: titleWidget,
    decoration: decoration,
    padding: padding,
    margin: margin,
  );
}

Widget descriptionWidget() {
  return Text('descriptionWidget');
}
