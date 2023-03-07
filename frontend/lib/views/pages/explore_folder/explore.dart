// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/views/pages/explore_folder/risk_card.dart';
import 'package:frontend/views/widgets/gov_schemes.dart';
import 'package:frontend/views/widgets/services.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      
      backgroundColor: Color(0xff2B3460),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: width*0.125,),
            Risk_card(),
            SizedBox(height: width*0.05,),
            SchemeSlider(),
            SizedBox(height: width*0.05,),
            services(
              heading: 'Investments',
              img_url: 'images/digital-gold.png',
              button_name: 'Digital Gold',
            ),
            SizedBox(height: width*0.05,),
            services(
              heading: 'Loans',
              img_url: 'images/home_loan.jpg',
              button_name: 'Home Loans',
            ),
            SizedBox(height: width*0.05,),
            services(
              heading: 'Insurance',
              img_url: 'images/life_insurance.jpg',
              button_name: 'Life Insurance',
            ),


          ],
        ),
      ),
    );
    
  }
}
