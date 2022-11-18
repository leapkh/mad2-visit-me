import 'package:flutter/material.dart';

import '../place.dart';

class PlaceDetailScreen extends StatefulWidget {

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();

}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {

  // Configuration

  String currentMenu = 'About';

  List<Place> places = [
    Place(1, 'Royal Palace', 'img_royal_palace.png'),
    Place(2, 'River Side', 'img_independent_monument.png'),
    Place(3, 'National Museum', 'img_national_museum.png'),
    Place(1, 'Royal Palace', 'img_national_museum.png'),
    Place(2, 'River Side', 'img_independent_monument.png'),
    Place(3, 'National Museum', 'img_national_museum.png'),
  ];


  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      child: Column(
        children: [
          topWidget(),
          menuWidget(),
          const Divider(),
          bottomWidget(),
        ],
      ),
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

  Widget menuWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        menuItemWidget('About'),
        menuItemWidget('Photos'),
        menuItemWidget('Reviews'),
      ],
    );
  }

  Widget bottomWidget() {
    if(currentMenu == 'About'){
      return aboutWidget();
    } else if (currentMenu == 'Photos'){
      return photosWidget();
    } else {
      return reviewsWidget();
    }
  }

  Widget aboutWidget(){
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
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
          SizedBox(
            height: 16,
          ),
          iconAndInfoWidget(Icons.location_on,
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."),
          SizedBox(
            height: 16,
          ),
          Text(
            'Related Places',
            style: TextStyle(fontSize: 18),
          ),
          relatedPlacesWidget(),
        ],
      ),
    );
  }

  Widget photosWidget(){
    return Text('This is Photos section');
  }

  Widget reviewsWidget(){
    return Text('This is Reviews section');
  }

  Widget transclusenBarWidget() {
    return Container(
      height: 62,
      color: Colors.white.withAlpha(113),
      child: topActionsWidget(),
    );
  }

  Widget menuItemWidget(String title) {
    final isActive = title == currentMenu;
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

    return GestureDetector(
      onTap: () {
        setState(() {
          currentMenu = title;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 36,
        child: titleWidget,
        decoration: decoration,
        padding: padding,
        margin: margin,
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

  Widget relatedPlacesWidget() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
          itemBuilder: placeItemWidget),
    );

    /*return SizedBox(
    height: 120,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (BuildContext context, int index){
          final place = places[index];
          return Column(
            children: [
              Image.asset('lib/image/${place.imageName}'),
              Text(place.name)
            ],
          );
        }),
  );*/
  }

  Widget topActionsWidget() {
    return Row(
      children: [
        IconButton(
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

  Widget placeItemWidget(BuildContext context, int index) {
    final place = places[index];
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            'lib/image/${place.imageName}',
            fit: BoxFit.cover,
          )),
          Text(place.name)
        ],
      ),
    );
  }

  void onBackButtonClick() {
    debugPrint('You click back.');
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
}
