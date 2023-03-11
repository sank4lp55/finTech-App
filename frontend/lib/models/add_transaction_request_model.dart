class AddTransactionRequestModel {
  String? type;
  String? refNo;
  String? amount;
  String? status;
  String? description;
  String? category;
  int? transactionSender;

  AddTransactionRequestModel(
      {this.type,
      this.refNo,
      this.amount,
      this.status,
      this.description,
      this.category,
      this.transactionSender});

  AddTransactionRequestModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    refNo = json['refNo'];
    amount = json['amount'];
    status = json['status'];
    description = json['description'];
    category = json['category'];
    transactionSender = json['transaction_sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['refNo'] = this.refNo;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['description'] = this.description;
    data['category'] = this.category;
    data['transaction_sender'] = this.transactionSender;
    return data;
  }
}
