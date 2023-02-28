import 'dart:convert';

import 'package:frontend/interface/shared_service.dart';
import 'package:frontend/models/login_request_model.dart';
import 'package:frontend/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class BackendInterface {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('http://localhost:3000/api/v1/auth/login');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    http.Response loginResponseModel = response;

    if (response.statusCode == 201) {
      //SHARED
      await SharedService.setLoginDetails(loginResponseJson(response.body));

//return loginResponseModel;
//return loginResponseModel;
      return true;
    } else {
      return false;
    }
  }

  // Future<LoginResponseModel> login(LoginRequestModel model) async {
  //   try {
  //     Map<String, String> requestHeaders = {
  //       'Content-Type': 'application/json',
  //     };

  //     var url =
  //         Uri.parse('http://fintech-app.up.railway.app/api/v1/auth/login');

  //     var response = await client.post(
  //       url,
  //       headers: requestHeaders,
  //       body: jsonEncode(model.toJson()),
  //     );
  //     if (response != null) {
  //       //var result = Result.fromJson(res);
  //       //return (LoginResponseModel.fromJson());
  //     }
  //     throw "Cannot get Signup availability but $response";
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
