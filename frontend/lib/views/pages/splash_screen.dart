import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/navigation_container.dart';
import 'package:frontend/views/pages/login_folder/loginpage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String? token = await storage.read(key: "token");
    await Future.delayed(Duration(milliseconds: 1500), () {});

    if (token != null) {
      Get.to(NavigationContainer());
    } else {
      Get.to(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Center(
        child: Container(
            //height: 50,
            width: width * 0.35,
            child: Image.asset('images/logo.png')),
      ),
    );
  }
}
