// class LoginResponseModel {
//   final String token;
//   final String error;
//   LoginResponseModel({this.token, this.error});
//   factory LoginResponseModel.fromjson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//         token: json["token"] != null ? json["token"] : "",
//         error: json["error"] != null ? json["error"] : "");
//   }
// }

// class LoginRequestModel {
//   String email;
//   String password;
//   LoginRequestModel({this.email, this.password});
//   Map<String, dynamic> tojson() {
//     Map<String, dynamic> map = {
//       "email": email.trim(),
//       "password": password.trim()
//     };
//     return map;
//   }
// }
