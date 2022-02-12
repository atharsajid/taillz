// import 'dart:convert';

// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:taillz/screens/resgistrationscreen/firstscreen/Login%20Api%20Service/login_model.dart';

// class ApiServicesController extends GetxController {
//   bool isLoading = false;
//   Future<LoginResponseModel> login(
//       LoginRequestModel requestModel, BuildContext context) async {
//     String url = "http://api.taillz.com/api/v1/clients/login";
//     final response = await http.post(Uri.https("reqres.in", "api/login"),
//         body: requestModel.tojson());

//     if (response.statusCode == 200) {
//       return LoginResponseModel.fromjson(jsonDecode(response.body));
//     } else if (response.statusCode == 400) {
//       showflushbar(context, "User not found");
//     } else if (response.statusCode == 500) {
//       showflushbar(context, "Network error");
//     } else {
//       throw Exception("Login Failed");
//     }
//   }
// }

// void showflushbar(BuildContext context, String title) {
//   Flushbar(
//     isDismissible: true,
//     messageSize: 16,
//     messageText: Text(
//       title,
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 16,
//       ),
//     ),
//     backgroundColor: Color(0xff121556),
//     flushbarPosition: FlushbarPosition.TOP,
//     duration: Duration(milliseconds: 1500),
//   )..show(context);
// }
