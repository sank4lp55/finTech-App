import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/interface/shared_service.dart';
import 'package:frontend/models/add_transaction_request_model.dart';
import 'package:frontend/models/add_transaction_response_model.dart';
import 'package:frontend/models/login_request_model.dart';
import 'package:frontend/models/login_response_model.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class BackendInterface {
  static var client = http.Client();
  final storage = FlutterSecureStorage();

  static Future<LoginResponseModel> login(LoginRequestModel model) async {
    // await Future.delayed(const Duration(seconds: 3));
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('https://fintech-app.up.railway.app/api/v1/auth/login');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    http.Response loginResponseModel = response;

    if (response.statusCode == 200) {
      //SHARED
      await SharedService.setLoginDetails(loginResponseJson(response.body));

//return loginResponseModel;
//return loginResponseModel;
      return loginResponseJson(response.body);
    } else {
      return loginResponseJson(response.body);
      ;
    }
  }

  static Future<UserModel> getUser(String uid, String token) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    // String? uid = await storage.read(key: "uid");
    // String? token = await storage.read(key: "token");
    var url = Uri.parse(
        'https://fintech-app.up.railway.app/api/v1/users/me'); // uid will be removed

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    });
    http.Response userModel = response;

    if (response.statusCode == 200) {
      //SHARED
      await SharedService.userDetails(userJson(response.body));

//return loginResponseModel;
//return loginResponseModel;
      return userJson(response.body);
    } else {
      return throw Exception("Unable to fetch data .");
    }
  }

  static Future<TransactionModel> getTransaction(
      String uid, String token) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    // String? uid = await storage.read(key: "uid");
    // String? token = await storage.read(key: "token");
    var url = Uri.parse(
        'https://fintech-app.up.railway.app/api/v1/trxn'); // uid will be removed

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': '$token',
    });
    http.Response transactionModel = response;

    if (response.statusCode == 200) {
      //SHARED
      await SharedService.transactionDetails(transactionJson(response.body));

//return loginResponseModel;
//return loginResponseModel;
      return transactionJson(response.body);
    } else {
      return throw Exception("Unable to fetch data .");
    }
  }

  static Future<AddTransactionResponseModel> addTransaction(
      AddTransactionRequestModel model) async {
    // await Future.delayed(const Duration(seconds: 3));
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.parse('https://fintech-app.up.railway.app/api/v1/trxn');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    http.Response addTransactionResponseModel = response;

    if (response.statusCode == 200) {
      //SHARED
      await SharedService.addTransactionDetails(
          addTransactionResponseJson(response.body));

//return loginResponseModel;
//return loginResponseModel;
      return addTransactionResponseJson(response.body);
    } else {
      return addTransactionResponseJson(response.body);
      ;
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
