class AddTransactionRequestModel {
  String? type;
  String? refNo;
  String? amount;
  String? status;
  String? date;
  String? description;
  String? category;

  AddTransactionRequestModel(
      {this.type,
      this.refNo,
      this.amount,
      this.status,
      this.date,
      this.description,
      this.category});

  AddTransactionRequestModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    refNo = json['refNo'];
    amount = json['amount'];
    status = json['status'];
    date = json['date'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['refNo'] = this.refNo;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['date'] = this.date;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
}
