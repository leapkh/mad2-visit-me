import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:visit_me/viewModel/province_list_view_model.dart';

import '../model/province.dart';

class ProvinceListWidget extends StatelessWidget {
  List<Province> provinceList = [];

  final viewModel = Get.put(ProvinceListViewModel());

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
        /*loadProvinceList().then((value){
          setState(() {
            provinceList = value;
          });
        });*/
        viewModel.loadProvince();
      },
        child: Text('Load Provinces'));
  }

  Widget provinceListView() {
    return Obx(() {
      print('Data changed');
      final provinceList = viewModel.provinceListObs.value;
      if(provinceList.isEmpty){
        return const Center(child: CircularProgressIndicator(),);
      } else {
        return ListView.builder(
          itemCount: provinceList.length,
          itemBuilder: (context, index) {
            final province = provinceList[index];
            return ListTile(title: Text(province.name),
            onTap: (){
              viewModel.removeProvince(index);
            },);
          },
        );
      }
    });



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
