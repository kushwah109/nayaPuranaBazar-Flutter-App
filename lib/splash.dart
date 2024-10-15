
import 'dart:async';

import 'package:flutter/material.dart';

import 'auth_screen/signup.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToHome();
  }
  void _navigateToHome(){
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Signup()) );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Naya Purana Bazar')),
    );
  }
}
