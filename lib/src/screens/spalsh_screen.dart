import 'dart:async';
// import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:togumogu/src/app.dart';
import 'package:togumogu/src/bloc/authentication/authentication_bloc.dart';
import 'package:togumogu/src/repository/authentication_repository.dart';
import 'package:togumogu/src/routes/router.gr.dart';
import 'package:togumogu/src/screens/home/home.dart';
import 'package:togumogu/src/screens/login/view/view.dart';
import 'package:togumogu/src/screens/welcome_screen.dart';
// import 'package:supply_mv/src/res/app_assets.dart';
// import 'package:supply_mv/src/routes/router.gr.dart' as route;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  // NavigatorState get _navigator => _navigatorKey.currentState;
  // AppRepository appRepository = AppRepository();

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<void> startTime() async {
    Future.delayed(Duration(microseconds: 5000));
  }

  // navigationPage() async {
  //   await Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (ctx) => Consumer<AuthenticationRepository>(
  //         builder: (ctx, auth, _) => FutureBuilder(
  //             future: auth.tryAutoLogin(),
  //             builder: (ctx, authsnap) =>
  //                 authsnap.connectionState == ConnectionState.waiting
  //                     ? SplashScreen()
  //                     : MyHomePage()),
  //       ),
  //     ),
  //   );
  // }

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
