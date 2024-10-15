
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:naya_purana_bazar/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Splash(),
        // routes: {
        // '/home':(context)=>HomeScreen(),
        // 'signup':(context)=>Signup(),
        // 'signin':(context)=>Signin(),
        //   'verify':(context)=>VerifyPage(),
        //   'intro':(context)=>Introslider()
        // },
    );
  }
}


