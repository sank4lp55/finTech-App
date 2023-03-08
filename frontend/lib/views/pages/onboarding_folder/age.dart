import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/utils/app_colors.dart';
import 'package:frontend/utils/app_image.dart';
import 'package:frontend/utils/app_string.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  List<String> _feelingTitleList = [
    "Happy",
    "Angry",
    "Anxious",
  ];
  List<String> _feelingImgList = [
    AppImages.grinningPng,
    AppImages.angryPng,
    AppImages.anxiousPng,
  ];

  Widget customPadding(
      {Widget? child,
      EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 30)}) {
    return Container(
      child: child,
      margin: margin,
    );
  }

  Widget _appBarWidget() {
    return customPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(AppImages.menuSvg),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(
              //       color: AppColors.borderGeyColors,
              //     )),
              child: Text(
                "Choose your Age Group",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _feelingWidget({required String title, required String image}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: AppString.normalFontFamily,
                color: AppColors.primaryColors,
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _containerWidget() {
    return Expanded(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 30,
            ),
            customPadding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome Sankalp !",
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.primaryColors,
                        fontFamily: AppString.normalFontFamily),
                  ),
                  Image.asset(AppImages.user)
                ],
              ),
            ),
            customPadding(
              child: Text(
                "You have been missed.",
                style: TextStyle(
                    fontSize: 17,
                    color: AppColors.primaryColors,
                    fontFamily: AppString.boldFontFamily),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0),
                  itemCount: _feelingImgList.length,
                  itemBuilder: (context, index) {
                    return _feelingWidget(
                      image: _feelingImgList[index],
                      title: _feelingTitleList[index],
                    );
                  }),
            ),
            customPadding(
              child: Text(
                "Let's Explore",
                style: TextStyle(
                    fontSize: 24,
                    color: AppColors.primaryColors,
                    fontFamily: AppString.boldFontFamily),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Container(
            //   height: 180,
            //   child: ListView(
            //     shrinkWrap: true,
            //     padding: EdgeInsets.only(left: 10),
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       _exploreWidget(
            //           title: "Guided \nMeditation",
            //           description: "16 Sessions",
            //           bgImage: AppImages.bg3Png),
            //       _exploreWidget(
            //           title: "Relax\nand Sleep",
            //           description: "24 Sessions",
            //           bgImage: AppImages.bg2Png),
            //       _exploreWidget(
            //           title: "Focus\nEnhancement",
            //           description: "21 Sessions",
            //           bgImage: AppImages.bg1Png),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              _appBarWidget(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              _containerWidget(),

              //_bottomMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
