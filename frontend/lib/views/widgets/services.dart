// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:frontend/views/widgets/image_button.dart';

class services extends StatelessWidget {
  final String heading;
  final String img_url;
  final String button_name;
  const services({
    super.key, 
    required this.heading,
    required this.img_url,
    required this.button_name,
    });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Card(
      color: Color(0xDDFFFFFF),
      child: Container(
          height: height * 0.2,
          width: width * 0.95,
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: width * 0.02,
              ),
              SizedBox(
                height: height * 0.1,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => imagebutton(
                    img_url: img_url,
                    button_name: button_name,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
