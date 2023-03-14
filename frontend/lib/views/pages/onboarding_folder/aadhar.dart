import 'package:flutter/material.dart';
import 'package:frontend/navigation_container.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/views/pages/login_folder/loginpage.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../../widgets/my_button.dart';

class verifyaadhar extends StatefulWidget {
  bool upload_aadhaar, capture_face;

  verifyaadhar({
    super.key,
    this.upload_aadhaar = false,
    this.capture_face = false,
  });

  @override
  State<verifyaadhar> createState() => _verifyaadharState();
}

class _verifyaadharState extends State<verifyaadhar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: GestureDetector(
              //     onTap: () => Navigator.pop(context),
              //     child: Icon(
              //       Icons.arrow_back,
              //       size: width * 0.08,
              //       color: Colors.black54,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                width: width * 0.6,
                height: height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/aadhar_verify.png',
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Verify Aadhaar Card',
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              // Text(
              //   "Enter your OTP code number",
              //   style: TextStyle(
              //     fontSize: width * 0.035,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black38,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(
                height: width * 0.07,
              ),
              Container(
                padding: EdgeInsets.all(width * 0.07),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: MyButton(
                        onTap: () {
                          setState(() {
                            widget.upload_aadhaar = true;
                          });
                          // Get.to(NavigationContainer());
                        },
                        h: height * 0.065,
                        w: width * 0.2,
                        text: "Upload Aadhaar Card",
                        textcolor: Colors.black,
                        bgcolor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: width * 0.06,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MyButton(
                        onTap: () {
                          final snackBar = SnackBar(
                              content: Text('Upload Aadhaar card then capture Face ID'));
                          widget.upload_aadhaar == true
                              ? setState(() {
                                  widget.upload_aadhaar == true
                                      ? widget.capture_face = true
                                      : widget.capture_face = false;
                                })
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                          ;
                          // Get.to(NavigationContainer());
                        },
                        h: height * 0.065,
                        w: width * 0.2,
                        text: "Capture Face ID",
                        textcolor: widget.upload_aadhaar == true
                            ? Colors.black
                            : Colors.grey,
                        bgcolor: Colors.grey[300],
                      ),
                    ),
                    SizedBox(
                      height: width * 0.06,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MyButton(
                        onTap: () {
                          final snackBar = SnackBar(
                            content:
                                Text('Capture Face ID then verify Aadhaar Card'),
                            backgroundColor: Colors.black,
                          );
                          widget.capture_face == true
                              ? custom_dialog(context, width)
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                          // Get.to(NavigationContainer());
                        },
                        h: height * 0.065,
                        w: width * 0.2,
                        text: "Verify Aadhaar",
                        textcolor: widget.capture_face == true
                            ? Colors.white
                            : Colors.grey,
                        bgcolor: widget.capture_face == true
                            ? dark
                            : Color(0xdd2B3467),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edit details",
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Register Again",
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: dark),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> custom_dialog(BuildContext context, width) {
    return Dialogs.materialDialog(
      color: Colors.white,
      msg: 'Aadhaar verified successfully ',
      title: 'Success',
      titleStyle:
          TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w600),
      msgStyle: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.w500),
      lottieBuilder: Lottie.asset(
        'images/lottie-success.json',
        fit: BoxFit.contain,
      ),
      context: context,
      actions: [
        IconsButton(
          onPressed: () {
            Get.to(LoginPage());
          },
          text: 'Login',
          padding: EdgeInsets.symmetric(vertical: width * 0.03),
          color: dark,
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: width * 0.05,
          ),
        ),
      ],
    );
  }
}
