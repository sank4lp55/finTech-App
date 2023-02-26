import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double h;
  final double w;

  const MyButton(
      {super.key,
      required this.onTap,
      this.text = "",
      required this.h,
      required this.w});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w,
        height: h,

        //padding: const EdgeInsets.all(20),
        //margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(height * 0.01),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: height * 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
