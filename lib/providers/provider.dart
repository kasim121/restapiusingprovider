import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import '../models/model.dart';

class MyProvider extends ChangeNotifier {
  static const apiEndpoint =
      'https://fmtest.dishco.com/shawmanservices/api/SPAGetServiceLineDetailsPTR/FunGetServiceLineDetails?SourceApp=WLA&PackageName=8X8syJfkvzrxI5fLHCbSqQIYViVLh2R016thr3Fw7L8%3D&SPAId=3';
  static const apiLogin ='https://reqres.in/api/login';
      
  bool isLoading = true;
  String error = '';
  ServiceLineDetailsModel? serviceLineDetailsModel;

  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint), headers: {
        'AndroidPhone':
            'EV6FTlgBhOalM+qjJpr2OZpAEpPkYJHC5I1aOWyeLevwSIpuzyKEAg==',
      });
      if (response.statusCode == 200) {
        serviceLineDetailsModel =
            serviceLineDetailsModelFromJson(response.body);
        debugPrint(
            "printing.. ${serviceLineDetailsModel!.serviceLineDetails!.first.serviceLineDescription}");
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  postLogin(String email, String name) async {
    try {
      Response response = await http.post(Uri.parse(apiLogin), body: {
        'email': email,
        'name': name,
      });
      if (response.statusCode == 200) {
        serviceLineDetailsModel =
            serviceLineDetailsModelFromJson(response.body);
        debugPrint(
            "printing.. ${serviceLineDetailsModel!.serviceLineDetails!.first.serviceLineDescription}");
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  //
}
