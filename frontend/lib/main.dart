import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/data/model/hive_models/add_date.dart';
import 'package:frontend/navigation_container.dart';
import 'package:frontend/views/pages/homepage.dart';
import 'package:frontend/views/pages/login_folder/loginpage.dart';
import 'package:frontend/views/pages/onboarding_folder/details.dart';
import 'package:frontend/views/pages/onboarding_folder/welcome.dart';
import 'package:frontend/views/pages/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = LoginPage();
  final storage = FlutterSecureStorage();

  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    //checkLogin();
  }

  // void checkLogin() async {
  //   String? token = await storage.read(key: "token");

  //   if (token != null) {
  //     setState(() {
  //       page = SplashScreen();
  //       page = NavigationContainer();
  //     });
  //   } else {
  //     page = LoginPage();
  //   }
  // }

  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/nav': (context) => NavigationContainer(),
        },
        home: SplashScreen());
  }
}
