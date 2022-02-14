import 'dart:async';
import 'package:flutter/material.dart';
import 'package:taillz/screens/resgistrationscreen/firstscreen/first_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
  

    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (builder) => FirstScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/splash.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }
}
