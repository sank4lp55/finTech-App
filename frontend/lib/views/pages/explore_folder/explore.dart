import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B3460),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.green,
            ),
            Text('hello',
            style: TextStyle(
              fontSize: 55,
            ),)
          ],
        ),
      ),
    );
    
  }
}
