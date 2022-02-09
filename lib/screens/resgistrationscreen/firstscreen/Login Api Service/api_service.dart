import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:taillz/screens/resgistrationscreen/firstscreen/Login%20Api%20Service/login_model.dart';

class ApiServicesController extends GetxController {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "http://api.taillz.com/api/v1/clients/login";
    final response = await http.post(
        Uri.https("reqres.in", "api/login"),
        body: requestModel.tojson());
    if (response.statusCode == 200) {
      return LoginResponseModel.fromjson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      print("username not found");
    } else {
      throw Exception("Login Failed");
    }
  }
}
