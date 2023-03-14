class Data {
  int? id;
  String? type;
  String? amount;
  String? refNo;
  String? date;
  String? status;
  String? description;
  String? category;
  int? transactionSender;
  int? transactionReceiver;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.type,
      this.amount,
      this.refNo,
      this.date,
      this.status,
      this.description,
      this.category,
      this.transactionSender,
      this.transactionReceiver,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    refNo = json['refNo'];
    date = json['date'];
    status = json['status'];
    description = json['description'];
    category = json['category'];
    transactionSender = json['transaction_sender'];
    transactionReceiver = json['transaction_receiver'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['refNo'] = this.refNo;
    data['date'] = this.date;
    data['status'] = this.status;
    data['description'] = this.description;
    data['category'] = this.category;
    data['transaction_sender'] = this.transactionSender;
    data['transaction_receiver'] = this.transactionReceiver;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
