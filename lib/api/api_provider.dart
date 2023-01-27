import 'dart:convert';

import 'package:http/http.dart';

import '../model/province.dart';

class ApiProvider {

  static Future<List<Province>> loadProvinceList() async {
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

