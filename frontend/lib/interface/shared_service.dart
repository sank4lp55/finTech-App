import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/add_transaction_response_model.dart';
import 'package:frontend/models/login_response_model.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/views/pages/login_folder/loginpage.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("Login_details");

    return isKeyExist;
  }

  static Future<LoginResponseModel?> loginDetils() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist("Login_details");

    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData("Login_details");

      return loginResponseJson(cacheData.syncData);
    }
  }

  static Future<void> setLoginDetails(
    LoginResponseModel model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_details", syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache("login_details");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => LoginPage()),
        (route) => false);
  }

  static Future<void> userDetails(
    UserModel model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "user_details", syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> transactionDetails(
    TransactionModel model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "transaction_details", syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> addTransactionDetails(
    AddTransactionResponseModel model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
        key: "login_details", syncData: jsonEncode(model.toJson()));

    await APICacheManager().addCacheData(cacheDBModel);
  }
}
