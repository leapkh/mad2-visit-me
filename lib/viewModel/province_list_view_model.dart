import 'package:get/get.dart';
import 'package:visit_me/api/api_provider.dart';
import 'package:visit_me/model/province.dart';

class ProvinceListViewModel extends GetxController {

  var provinceListObs = <Province>[].obs;

  void loadProvince(){

    ApiProvider.loadProvinceList().then((value){
      provinceListObs.value = value;
    });

  }

  void removeProvince(int index){
    provinceListObs.removeAt(index);
  }

}