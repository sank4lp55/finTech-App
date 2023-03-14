import 'package:frontend/models/transaction_data_model.dart';
import 'dart:convert';

TransactionModel transactionJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

class TransactionModel {
  bool? success;
  List<Data>? data;

  TransactionModel({this.success, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
