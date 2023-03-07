import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/views/pages/expense_folder/expense_manager.dart';
import 'package:frontend/views/widgets/bottom_nav_bar.dart';
import 'package:frontend/views/widgets/search_bar.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: dark,
        radius: 25,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ExpenseManager()));
            },
            child: Container(
                child: Icon(
              Icons.question_answer,
              color: Colors.white,
            ))),
      ),
      backgroundColor: Colors.grey.shade300,
      //bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          // Container(
          //   height: size.height * .10,
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     // image: DecorationImage(
          //     //   image: AssetImage("images/rich.png"),
          //     //   fit: BoxFit.fitWidth,
          //     // ),
          //   ),
          // ),
          Container(
            height: size.height * .44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17)),
              color: dark,
              // image: DecorationImage(
              //   image: AssetImage("images/rich.png"),
              //   fit: BoxFit.fitWidth,
              // ),
            ),
            // child: Container(
            //   height: 10,
            //   width: 10,
            //   decoration: BoxDecoration(
            //     color: dark,
            //     image: DecorationImage(
            //       image: AssetImage("images/rich.png"),
            //       fit: BoxFit.fitWidth,
            //     ),
            //   ),
            // ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: size.width * .35,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage("images/pie-chart.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Good Afternoon",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 35),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Sankalp Srivastava",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 21),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                        "You have been missed ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .6, // it just take the 50% width
                      child: SearchBar(),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Wrap(
                        //alignment: WrapAlignment.end,
                        spacing: 20,
                        runSpacing: 20,
                        children: <Widget>[
                          SeassionCard(
                            seassionNum: 1,
                            isDone: true,
                            text: "Your Stats",
                            image: "images/presentation.png",
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 2,
                            text: "Debts",
                            image: "images/liability.png",
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 3,
                            text: "Pay",
                            image: "images/money.png",
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 4,
                            text: "Your Inv",
                            image: "images/investment.png",
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 5,
                            text: "Schemes",
                            image: "images/rgb.png",
                            press: () {},
                          ),
                          SeassionCard(
                            seassionNum: 6,
                            text: "Near You",
                            image: "images/location.png",
                            press: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "More",
                      // style: Theme.of(context)
                      //     .textTheme
                      //     .title
                      //     .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: SvgPicture.asset(
                              "images/basics.svg",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "The basics",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  // style: Theme.of(context).textTheme.subtitle,
                                ),
                                Text(
                                  "Best Investment practices",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "images/lock.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: SvgPicture.asset(
                              "images/podcast.svg",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Podcasts",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  // style: Theme.of(context).textTheme.subtitle,
                                ),
                                Text(
                                  "Popular finance podcasts this week ",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "images/lock.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: SvgPicture.asset(
                              "images/experience.svg",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Experience",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  // style: Theme.of(context).textTheme.subtitle,
                                ),
                                Text(
                                  "Read others finance experience and share your own",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "images/lock.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 80,
                            height: 80,
                            child: SvgPicture.asset(
                              "images/personal.svg",
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Personalised",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                  // style: Theme.of(context).textTheme.subtitle,
                                ),
                                Text(
                                  "Get professinal help to manage your finance",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "images/padlock.png",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final String text;
  final String image;
  final bool isDone;
  final Function press;
  const SeassionCard({
    Key? key,
    required this.seassionNum,
    required this.text,
    required this.image,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: width * 0.25,
          height: width *
              0.25, // constraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            color: Colors.white38,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              // onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            image,
                            height: 60,
                          ),
                        ),
                        // SizedBox(width: 10),
                        // Text(
                        //   "Session $seassionNum",
                        //   // style: Theme.of(context).textTheme.subtitle,
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text("$text"),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
