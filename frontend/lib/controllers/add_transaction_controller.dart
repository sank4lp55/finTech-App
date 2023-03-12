import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/interface/backend_interface.dart';
import 'package:frontend/models/add_transaction_request_model.dart';
import 'package:frontend/models/add_transaction_response_model.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/models/transaction_data_model.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  String type;
  String refNo;
  String amount;
  String status;
  String description;
  String category;
  int transactionSender;

  AddTransactionController(this.type, this.refNo, this.amount, this.status,
      this.description, this.category, this.transactionSender);

  var isLoading = false.obs;

  final storage = FlutterSecureStorage();

  @override
  void onInit() async {
    super.onInit();
    addTransactionData();
  }
  //
  //
  //
  //

  Future<void> addTransactionData() async {
    try {
      isLoading(true);
      String? principle = await storage.read(key: "uid");
      String? token = await storage.read(key: "token");
      AddTransactionRequestModel model = AddTransactionRequestModel(
          type: type,
          refNo: refNo,
          amount: amount,
          status: status,
          description: description,
          category: category,
          token: token,
          transactionSender: transactionSender);
      AddTransactionResponseModel modelTemp =
          await BackendInterface.addTransaction(model);
    } finally {
      isLoading(false);
    }
    return;
  }
}
