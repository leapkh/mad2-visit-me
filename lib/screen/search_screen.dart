import 'package:flutter/material.dart';

// Widget class
class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }

}

// State class
class _State extends State<SearchScreen> {

  List<String> keywords = [
    'royal palace',
    'national museum',
    'river side',
    'royal palace',
    'national museum',
    'river side',
    'Angkor Wat'
  ];

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      child: Column(
        children: [
          toolbarWidget(),
          sectionTitleWidget('Recent Searches', Icons.recent_actors),
          recentSearchItemsWidget(),
          sectionTitleWidget('Advanced Searches', Icons.search),
        ],
      ),
    );

    return Scaffold(
      body: body,
    );
  }

  Widget toolbarWidget() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 54,
      color: Colors.green,
      child: TextField(),
    );
  }

  Widget sectionTitleWidget(String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
          Icon(iconData)
        ],
      ),
    );
  }

  Widget recentSearchItemsWidget() {
    /*final items = keywords.map((keyword) {
    return recentSearchItemWidget(keyword);
  }).toList();

  return Wrap(
    children: items,
  );*/

    final favoriteKeywords = keywords.where((keyword) {
      return keyword.contains('s');
    }).toList();

    return Wrap(
      children: favoriteKeywords
          .map((keyword) => recentSearchItemWidget(keyword))
          .toList(),
    );
  }

  Widget recentSearchItemWidget(String keyword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
          label: Text(
            keyword,
          )),
    );
  }

}