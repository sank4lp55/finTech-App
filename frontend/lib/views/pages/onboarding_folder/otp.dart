import 'package:flutter/material.dart';
import 'package:frontend/navigation_container.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/views/pages/onboarding_folder/aadhar.dart';
import 'package:frontend/views/widgets/my_button.dart';
import 'package:get/get.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: width * 0.08,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                width: width * 0.5,
                height: height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/illustration-3.png',
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: false),
                        _textFieldOTP(first: false, last: true),
                      ],
                    ),
                    SizedBox(
                      height: width * 0.06,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MyButton(
                        onTap: () {
                          Get.to(verifyaadhar());
                        },
                        h: height * 0.065,
                        w: width * 0.2,
                        text: "Verify OTP",
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: width * 0.04,
              ),
              Text(
                "Resend Code",
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: dark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({bool? first, last}) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Container(
      height: height * 0.068,
      child: AspectRatio(
        aspectRatio: 1,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: dark),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
