import 'dart:convert';
import 'package:faccinate_demo/model/model_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  RxList<ModelCategory> listOfCategory = <ModelCategory>[].obs;



  Future<void> getCategory() async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://fm.fascinateinfotech.com/api/categories",
        ),
        headers: {"api-key":"MnhvdDdpYklrdVBCWEdjT004MjNDNWhsNnFMZlFFTm9lM2xrUFd3ckZwQTFMUm1wNXlTT1h6a1NMRmJ46343d7899ab41"}
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        for(int i = 0;i< result['data'].length;i++){
          listOfCategory.add(ModelCategory(id: result['data'][i]['id'],icon: result['data'][i]['icon'],name:  result['data'][i]['name'] ));
        }
        // listOfCategory = (result['data'] as List) // Same above
        //     .map((data) => ModelCategory.fromJson(data))
        //     .toList();

      }else{
          throw Exception("Fail Load..");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}
