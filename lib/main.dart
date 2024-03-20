import 'dart:io';
import 'package:ecommerce_app/core/Config/Config.dart';
import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  // await Config.LoadLang("en");
await CacheHelper().intializeSharedPref();
  Platform.isAndroid?await Firebase.initializeApp(
 options:
 const FirebaseOptions(apiKey: "AIzaSyCjeTXWGeA04teWPYD-5JoKJZ2tf6SInz8",
     appId: "1:212221207991:android:84728c8099285acd7d3432",
     messagingSenderId: "212221207991",
     projectId: "stylish-5cd17")
  ):await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
              scaffoldBackgroundColor: AppColor.offWhite
          ),
          routerConfig: gorouter,
          debugShowCheckedModeBanner: false,
        );
      },

    );
  }
}