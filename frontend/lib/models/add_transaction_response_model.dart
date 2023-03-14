import 'dart:convert';

AddTransactionResponseModel addTransactionResponseJson(String str) =>
    AddTransactionResponseModel.fromJson(json.decode(str));

class AddTransactionResponseModel {
  bool? success;
  Data? data;

  AddTransactionResponseModel({this.success, this.data});

  AddTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? refNo;
  String? amount;
  String? status;
  String? date;
  String? description;
  String? category;
  String? updatedAt;
  String? createdAt;

  Data(
      {this.id,
      this.type,
      this.refNo,
      this.amount,
      this.status,
      this.date,
      this.description,
      this.category,
      this.updatedAt,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    refNo = json['refNo'];
    amount = json['amount'];
    status = json['status'];
    date = json['date'];
    description = json['description'];
    category = json['category'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['refNo'] = this.refNo;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['date'] = this.date;
    data['description'] = this.description;
    data['category'] = this.category;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
