import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/interface/backend_interface.dart';
import 'package:frontend/models/transaction_model.dart';
import 'package:frontend/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var id = 0.obs;
  var uid = "".obs;
  var fullname = "".obs;
  var email = "".obs;
  var mobile = "".obs;
  var country = "".obs;
  var state = "".obs; //user, admin
  var city = "".obs;
  var pincode = "".obs;
  var streetAddress = "".obs;
  var bio = "".obs;
  var image = "".obs;
  var links = [];
  var accountStatus = 0.obs;
  var userType = 0.obs;
  var createdAt = "".obs;
  var updatedAt = "".obs;

  var linkedIn = "".obs;
  var twitter = "".obs;
  var instagram = "".obs;
  var facebook = "".obs;
  var website = "".obs;

  var isLoading = false.obs;

  final storage = FlutterSecureStorage();

  @override
  void onInit() async {
    super.onInit();
    getUserData();
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

  Future<void> getUserData() async {
    try {
      isLoading(true);
      String? principle = await storage.read(key: "uid");
      String? token = await storage.read(key: "token");
      UserModel userModel = await BackendInterface.getUser(principle!, token!);
      //TransactionModel transactionModel =
      //   await BackendInterface.getTransaction(principle!, token!);

      id.value = userModel.data!.id!.toInt();
      uid.value = userModel.data!.uid!.toString();
      fullname.value = userModel.data!.fullName!.toString();
      email.value = userModel.data!.email!.toString();
      mobile.value = userModel.data!.mobile!.toString();
      country.value = userModel.data!.country!.toString();
      state.value = userModel.data!.state!.toString();
      city.value = userModel.data!.city!.toString();
      pincode.value = userModel.data!.pincode!.toString();
      streetAddress.value = userModel.data!.streetAddress!.toString();
      bio.value = userModel.data!.bio!.toString();
      image.value = userModel.data!.image!.toString();
      links = userModel.data!.links as List;
      accountStatus.value = userModel.data!.accountStatus!.toInt();
      userType.value = userModel.data!.userType!.toInt();
      createdAt.value = userModel.data!.createdAt!.toString();
      updatedAt.value = userModel.data!.updatedAt!.toString();
      linkedIn.value = userModel.data!.links!.linkedIn!.toString();
      twitter.value = userModel.data!.links!.twitter!.toString();
      instagram.value = userModel.data!.links!.instagram!.toString();
      facebook.value = userModel.data!.links!.facebook!.toString();
      website.value = userModel.data!.links!.website!.toString();
    } finally {
      isLoading(false);
    }
    return;
  }
}
