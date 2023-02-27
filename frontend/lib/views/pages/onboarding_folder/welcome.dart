import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/views/pages/login_folder/loginpage.dart';
import 'package:frontend/views/pages/onboarding_folder/details.dart';
import 'package:frontend/views/pages/onboarding_folder/register.dart';
import 'package:frontend/views/widgets/my_button.dart';
import 'package:get/get.dart';
//import 'package:flutter_otp_verification_ui/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Image.asset(
                'images/illustration-1.png',
                width: width * 0.6,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Let's get started",
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Never a better time than now to start.",
                style: TextStyle(
                  fontSize: width * 0.036,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 38,
              ),
              SizedBox(
                  width: double.infinity,
                  child: MyButton(
                    onTap: () {
                      Get.to(DetailsPage());
                    },
                    h: height * 0.065,
                    w: width * 0.5,
                    text: "Register",
                  )),
              SizedBox(
                height: 22,
              ),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Get.to(LoginPage());
                  },
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.065,

                    //padding: const EdgeInsets.all(20),
                    //margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(height * 0.01),
                    ),
                    child: Center(
                      child: Text(
                        "Back to Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
