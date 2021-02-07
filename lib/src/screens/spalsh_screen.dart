import 'dart:async';

// import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/screens/welcome_screen.dart';
// import 'package:supply_mv/src/res/app_assets.dart';
// import 'package:supply_mv/src/routes/router.gr.dart' as route;


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // AppRepository appRepository = AppRepository();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<void> startTime() async {
    var _duration = new Duration(milliseconds: 5000);
    Timer(_duration, navigationPage);
  }
  
  navigationPage() async {
   
    await Navigator.pushReplacement(context, MaterialPageRoute(
     builder: (context)=> WelcomeScreen() 
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: AppColors.backGroundColor,
      child: Scaffold(
        //  backgroundColor: AppColors.backGroundColor,
        body: Center(
          child: Image.asset(
            "assets/images/togumogu.png",
            height: 245,
            width: 245,
          ),
        ),
      ),
    );
  }
}
