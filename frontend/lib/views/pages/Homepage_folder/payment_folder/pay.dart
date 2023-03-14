import 'package:flutter/material.dart';
import 'package:frontend/utils/app_colors.dart';
import 'package:frontend/utils/pay_colors.dart';
import 'package:frontend/views/pages/Homepage_folder/payment_folder/scanner.dart';
// import 'package:locpay/screens/auth_screen.dart';
// import 'package:locpay/screens/login_screen.dart';
// import 'package:locpay/screens/upi_list_screen.dart';
// import 'package:locpay/services/firebase_services.dart';
// import 'package:locpay/services/google_signin.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:frontend/views/pages/Homepage_folder/payment_folder/upi_direct_screen.dart';
// import 'package:locpay/services/location.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:locpay/screens/scanner.dart';

// import 'package:locpay/services/firebase_database.dart';
// import 'package:locpay/services/user_information.dart';
// import 'package:locpay/services/globals.dart' as globals;
// import 'package:firebase_database/firebase_database.dart';
// import 'signin_screen.dart';
// void main() {
//   runApp(const MyApp());
// }

enum MenuItem {
  item1,
}
//#212832
//#3A3D46
//#00ADB4
//#EEEEEE

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Pay(),
//     );
//   }
// }

class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  // int _selectedIndex = 0;
  //
  // final user = FirebaseAuth.instance.currentUser!;
  //final user = FirebaseAuth.instance.currentUser;
  // final String email = UserInformation().email.text;
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // Stream<List<Payer>> readPayers() => FirebaseFirestore.instance
  //     .collection('users')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Payer.fromJson(doc.data())).toList());

  @override
  void initState() {
    super.initState();
    //getLocation();
  }

  // void getLocation() async {
  //   Location location = Location();
  //   await location.getCurrentLocation();
  // }

  // Future<String> getName() async {
  //   String name =
  //       (await FirebaseDatabase.instance.ref("users/$email/name").once())
  //           .toString();
  //   return name;
  // }

  // getProfileImage() async {
  //   if (FirebaseAuth.instance.currentUser!.photoURL != null) {
  //     return Image.network(
  //       FirebaseAuth.instance.currentUser!.photoURL!,
  //       height: 100,
  //       width: 100,
  //     );
  //   } else {
  //     return const Icon(
  //       Icons.account_circle,
  //       size: 100,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // name = globals.name;
    // // debugPrint(UserInformation().name);
    // if (user != null && user!.displayName != null) {
    //   if (user!.displayName != null) {
    //     debugPrint(user!.displayName.toString());
    //     name = user!.displayName!;
    //     debugPrint(name);
    //   } else {}
    // } else {}
    return Scaffold(
      backgroundColor: kIconColour,
      body: SafeArea(
        child: SlidingUpPanel(
          defaultPanelState: PanelState.OPEN,
          minHeight: screenHeight * 0.59,
          maxHeight: screenHeight * 0.88,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 18.0,
              color: Colors.black45,
            )
          ],
          color: kContainerColour,
          margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // const Text(
                      //   'PayBook Payments',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 20.0,
                      //     // fontFamily: 'Raleway',
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      PopupMenuButton<MenuItem>(
                        onSelected: (item1) async {
                          // showDialog(
                          //   context: context,
                          //   barrierDismissible: false,
                          //   builder: (context) => const Center(
                          //     child: CircularProgressIndicator(),
                          //   ),
                          // );
                          // final provider = Provider.of<GoogleSignInProvider>(
                          //     context,
                          //     listen: false);
                          // provider.logout();
                          // // debugPrint(FirebaseAuth
                          // //     .instance.currentUser!.displayName
                          // //     .toString());
                          // FirebaseAuth.instance.signOut();
                          // navigatorKey.currentState!
                          //     .popUntil((route) => route.isFirst);
                          // await Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const AuthScreen()));
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: MenuItem.item1,
                            child: Text('Logout'),
                          )
                        ],
                        child: const Icon(
                          Icons.arrow_back,
                          size: 40.0,
                          color: kContainerColour,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: size.width * .5,
              //   width: size.width * 0.5,
              //   decoration: BoxDecoration(
              //     color: Colors.transparent,
              // image: DecorationImage(
              //   image: AssetImage("assets/paybookPayments.png"),
              //   fit: BoxFit.fitWidth,
              // ),
              //   ),
              // ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: [1, 2, 3, 4, 5].map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 15.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/paybookPayments.png"),
                              fit: BoxFit.fitWidth,
                            ),
                            color: kContainerColour,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
                //options: CarouselOptions(height: 200.0),
              ),
            ],
          ),
          panel: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Make your payments instantly !',
                  //'Hey, ${globals.name}!',
                  style: const TextStyle(
                    fontFamily: 'Raleway',
                    color: kIconColour,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kIconColour,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Transfer Money',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: kContainerColour,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const ScannerScreen()));
                                    },
                                    child: const Icon(
                                      Icons.qr_code_scanner,
                                      size: 80.0,
                                      color: kContainerColour,
                                    ),
                                  ),
                                  const Text(
                                    'Scan & Pay\n\n',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kContainerColour,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32.0,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //  debugPrint("${globals.name}d");
                                      // debugPrint("${globals.name}e");
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  const UpiDirectScreen()));
                                    },
                                    child: const Icon(
                                      Icons.account_box_outlined,
                                      size: 80.0,
                                      color: kContainerColour,
                                    ),
                                  ),
                                  const Text(
                                    '\nTo UPI',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kContainerColour,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32.0,
                                    ),
                                  ),
                                ],
                              ),
                              // Column(
                              //   children: const [
                              //     Icon(
                              //       Icons.account_balance,
                              //       size: 40.0,
                              //       color: kIconColour,
                              //     ),
                              //     Text(
                              //       '\nTo Account\n\n',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //       ),
                              //     ),
                              //     Icon(
                              //       Icons.account_balance_wallet,
                              //       size: 40.0,
                              //       color: kIconColour,
                              //     ),
                              //     Text(
                              //       '\nCheck Balance',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //       ),
                              //     )
                              //   ],
                              // ),
                              // Column(
                              //   children: const [
                              //     Icon(
                              //       Icons.archive_rounded,
                              //       size: 40.0,
                              //       color: kIconColour,
                              //     ),
                              //     Text(
                              //       '\nTo Self Account\n\n',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //       ),
                              //     ),
                              //     Icon(
                              //       Icons.account_balance_wallet,
                              //       size: 40.0,
                              //       color: kIconColour,
                              //     ),
                              //     Text(
                              //       '\nCheck Balance',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //       ),
                              //     )
                              //   ],
                              // ),
                              // Column(
                              //   children: const [
                              //     Icon(
                              //       Icons.account_balance_wallet,
                              //       size: 40.0,
                              //       color: kIconColour,
                              //     ),
                              //     Text(
                              //       '\nCheck Balance\n\n',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //       ),
                              //     ),
                              //     Icon(
                              //       Icons.account_balance_wallet,
                              //       size: 40.0,
                              //       color: kIconColour,
                              //     ),
                              //     Text(
                              //       '\nCheck Balance',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //         fontSize: 12.0,
                              //       ),
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // bottomNavigationBar: BottomNavigationBar(
  //   items: const <BottomNavigationBarItem>[
  //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Locations'),
  //   ],
  //   currentIndex: _selectedIndex,
  //   selectedItemColor: kBackgroundColour,
  //   onTap: _onItemTapped,
  // ),

}
