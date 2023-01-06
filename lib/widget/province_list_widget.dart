import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/province.dart';

class ProvinceListWidget extends StatefulWidget {
  @override
  State<ProvinceListWidget> createState() => _ProvinceListWidgetState();
}

class _ProvinceListWidgetState extends State<ProvinceListWidget> {
  List<Province> provinceList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [button(), Expanded(child: provinceListView())],
    );
  }

  Widget button() {
    return ElevatedButton(
        /*onPressed: () async {
          provinceList = await loadProvinceList();
          setState(() {

          });
        },*/
      onPressed: (){
        loadProvinceList().then((value){
          setState(() {
            provinceList = value;
          });
        });
      },
        child: Text('Load Provinces'));
  }

  Widget provinceListView() {
    if (provinceList.isEmpty) {
      return SizedBox.shrink();
    } else {
      return ListView.builder(
        itemCount: provinceList.length,
        itemBuilder: (context, index) {
          final province = provinceList[index];
          return ListTile(title: Text(province.name),);
        },
      );
    }
  }

  Future<List<Province>> loadProvinceList() async {
    // Load data from API
    final url = "http://localhost:8080/provinces.json";
    final uri = Uri.parse(url);
    final response = await get(uri);

    print(response.body);

    // Deserialize to object
    final jsonString = response.body;
    List<dynamic> itemList = jsonDecode(jsonString);
    final provinceList = itemList.map((e) {
      final provinceJson = e as Map<String, dynamic>;
      int id = provinceJson['id'];
      String name = provinceJson['name'];
      String imageUrl = provinceJson['imageUrl'];
      return Province(id, name, imageUrl);
    }).toList();

    return provinceList;
  }
}
