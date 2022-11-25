import 'package:flutter/material.dart';
import 'package:visit_me/widget/account_widget.dart';
import 'package:visit_me/widget/home_widget.dart';
import 'package:visit_me/widget/more_widget.dart';
import 'package:visit_me/widget/province_list_widget.dart';
import 'package:visit_me/widget/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: body(),
    );
  }

  PreferredSizeWidget? appBar(){
    if(navIndex == 0 || navIndex == 3){
      return null;
    }

    String title = '';
    if(navIndex == 1) {
      title = 'Provinces';
    }else if(navIndex == 2){
      return AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search places'
          ),
        ),
      );
    } else if(navIndex == 4){
      title = 'More';
    }

    return AppBar(
      title: Text(title),
    );
  }

  Widget bottomNavigationBar(){
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          navIndex = index;
        });
      },
        currentIndex: navIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Provinces'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
      BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
    ]);
  }

  Widget body(){

    if(navIndex == 0){
      return HomeWidget();
    } else if(navIndex == 1){
      return ProvinceListWidget();
    } else if(navIndex == 2){
      return SearchWidget();
    } else if(navIndex == 3){
      return AccountWidget();
    } else {
      return MoreWidget();
    }

  }

}
