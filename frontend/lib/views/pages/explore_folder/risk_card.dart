// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/views/pages/explore_folder/results.dart';
import 'package:get/get.dart';

class Risk_card extends StatefulWidget {
  const Risk_card({super.key});

  @override
  State<Risk_card> createState() => _Risk_cardState();
}

class _Risk_cardState extends State<Risk_card> {
  final amount = TextEditingController();
  double risk_val = 10;
  int selected_duration_ind = 0;

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Center(
      child: Card(
        elevation: 20,
        color: Color(0xDDFFFFFF),
        child: Container(
          width: width * 0.95,
          height: height * 0.55,
          padding: EdgeInsets.all(width * 0.05),
          decoration: BoxDecoration(
              // color: Colors.white30,
              borderRadius: BorderRadius.circular(7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: width * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    height: width * 0.2,
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: width * 0.5,
                    child: TextField(
                      controller: amount,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff2B3460),
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xff2B3460),
                          )),
                          prefixIcon: Icon(Icons.currency_rupee),
                          prefixIconColor: Color(0xff2B3460)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: width * 0.01,
              ),
              Row(
                children: [
                  Text(
                    'Risk',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  customslider(),
                  Text(
                    '${risk_val.round().toString()}%',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Row(
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      customradio("<5 yr", 0),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      customradio("5-15 yr", 1),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      customradio(">15 yr", 2),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Add Filters',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.045,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.06,
              ),
              OutlinedButton(
                  onPressed: () {
                    Get.to(
                      Results(
                        amount: amount.text,
                        risk_factor: risk_val,
                        duration: selected_duration_ind,
                      )
                    );
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff2B3460)),
                      // shape: ,
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: width * 0.07, vertical: width * 0.03))),
                  child: Text(
                    'Show Results',
                    style:
                        TextStyle(fontSize: width * 0.05, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget customslider() => Slider(
        value: risk_val,
        min: 0,
        max: 100,
        divisions: 50,
        // label: risk_val.round().toString(),
        onChanged: ((value) => setState(() {
              risk_val = value;
            })),
      );
  Widget customradio(String text, int index) => OutlinedButton(
      onPressed: () {
        setState(() {
          selected_duration_ind = index;
        });
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        side: MaterialStateProperty.all(BorderSide(
            color:
                selected_duration_ind == index ? Colors.blue : Colors.black)),
        backgroundColor: selected_duration_ind == index
            ? MaterialStateProperty.all<Color>(Colors.yellow.shade200)
            : MaterialStateProperty.all<Color>(Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected_duration_ind == index ? Colors.blue : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ));
}
