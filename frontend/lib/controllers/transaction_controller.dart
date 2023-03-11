import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/interface/backend_interface.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/models/transaction_data_model.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  TransactionModel? model;

  // var id = 0.obs;
  // var type = "".obs;
  // var amount = "".obs;
  // var refNo = "".obs;
  // var status = "".obs;
  // var description = "".obs;
  // var category = "".obs; //user, admin
  // var transaction_sender = 0.obs;
  // var transaction_receiver = 0.obs;
  // var createdAt = "".obs;
  // var updatedAt = "".obs;

  var isLoading = false.obs;

  final storage = FlutterSecureStorage();

  @override
  void onInit() async {
    super.onInit();
    getTransactionData();
  }

  // }

  // final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});
  // Map<String, dynamic> get user => _user.value;

  // Rx<String> _uid = "".obs;

  // updateUserId(String uid) {
  //   _uid.value = uid;
  //   getUserData();
  // }
  // String principal =
  //     "zxg6n-qanyj-g6fvl-5ysfr-pdpi4-p6pk5-mf3uy-dkq27-y3upv-o6ov6-dae";

  Future<void> getTransactionData() async {
    try {
      isLoading(true);
      String? principle = await storage.read(key: "uid");
      String? token = await storage.read(key: "token");
      //UserModel userModel = await BackendInterface.getUser(principle!, token!);
      TransactionModel modelTemp =
          await BackendInterface.getTransaction(principle!, token!);
      model = modelTemp;

      // id.value = transactionModel.data!.id!.toInt();
      // uid.value = transactionModel.data!.uid!.toString();
      // fullname.value = transactionModel.data!.fullName!.toString();
      // email.value = transactionModel.data!.email!.toString();
      // mobile.value = transactionModel.data!.mobile!.toString();
      // country.value = transactionModel.data!.country!.toString();
      // state.value = transactionModel.data!.state!.toString();
      // city.value = transactionModel.data!.city!.toString();
      // pincode.value = transactionModel.data!.pincode!.toString();
      // streetAddress.value = transactionModel.data!.streetAddress!.toString();
      // bio.value = userModel.data!.bio!.toString();
      // image.value = userModel.data!.image!.toString();
      // links = userModel.data!.links as List;
      // accountStatus.value = userModel.data!.accountStatus!.toInt();
      // userType.value = userModel.data!.userType!.toInt();
      // createdAt.value = userModel.data!.createdAt!.toString();
      // updatedAt.value = userModel.data!.updatedAt!.toString();
      // linkedIn.value = userModel.data!.links!.linkedIn!.toString();
      // twitter.value = userModel.data!.links!.twitter!.toString();
      // instagram.value = userModel.data!.links!.instagram!.toString();
      // facebook.value = userModel.data!.links!.facebook!.toString();
      // website.value = userModel.data!.links!.website!.toString();
    } finally {
      isLoading(false);
    }
    return;
  }
}
