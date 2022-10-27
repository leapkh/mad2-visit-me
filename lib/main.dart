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

  const margin = EdgeInsets.all(16);

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
      const Divider(),
      bottomWidget(),
    ],
  );

  return Scaffold(
    body: body,
  );
}

Widget topWidget() {
  return Stack(
    children: [
      Image.asset('lib/image/img_royal_palace.png'),
      transclusenBarWidget(),
    ],
  );
}

Widget transclusenBarWidget() {
  return Container(
    height: 62,
    color: Colors.white.withAlpha(113),
    child: topActionsWidget(),
  );
}

void onBackButtonClick() {
  debugPrint('You click back.');
}

Widget topActionsWidget() {
  return Row(
    children: [
      const IconButton(
          onPressed: onBackButtonClick,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      const Spacer(),
      favoriteButton(),
      const Icon(
        Icons.share,
        color: Colors.white,
      ),
    ],
  );
}

Widget favoriteButton() {
  return IconButton(
      onPressed: () {
        print('You click on Favorite');
      },
      icon: Icon(
        Icons.favorite_outline,
        color: Colors.white,
      ));
}

Widget menuWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      menuItemWidget('About', isActive: true),
      menuItemWidget('Photos'),
      menuItemWidget('Photos'),
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

Widget bottomWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        placeNameWidget(),
        rateAndReviewWidget(),
        SizedBox(
          height: 16,
        ),
        iconAndInfoWidget(Icons.info,
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
        SizedBox(
          height: 16,
        ),
        iconAndInfoWidget(Icons.location_on,
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
      ],
    ),
  );
}

Widget placeNameWidget() {
  return Text(
    'Royal Palace',
    style: TextStyle(fontSize: 26),
  );
}

Widget rateAndReviewWidget() {
  return Row(
    children: [
      starWidget(),
      starWidget(),
      starWidget(),
      starWidget(),
      starWidget(),
      SizedBox(
        width: 8,
      ),
      Text('7k reviews'),
    ],
  );
}

Widget starWidget() {
  return const Icon(
    Icons.star,
    color: Colors.amber,
  );
}

Widget iconAndInfoWidget(IconData iconData, String info) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        iconData,
        color: Colors.green,
      ),
      const SizedBox(
        width: 16,
      ),
      Expanded(child: Text(info))
    ],
  );
}
