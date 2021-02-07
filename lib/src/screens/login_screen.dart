import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/resources/icons/my_flutter_app_icons.dart';
import 'package:togumogu/src/routes/router.gr.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _rememberMe = false;
  }

  setRememberMe(bool val) {
    setState(() {
      _rememberMe = val;
    });
  }

// This goes to the build method

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;
    var textStyle = TextStyle(fontSize: 20, color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/images/togumogu.png"),
              width: SizeConfig.safeBlockHorizontal * .3,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * .02,
            ),
            Container(
              child: Text("Please Login to continue using our app."),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * .09,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            //   child: RadioListTile(
            //     contentPadding: EdgeInsets.symmetric(horizontal: 30),
            //     value: 1,
            //     groupValue: selectedRadioTile,
            //     title: Text("Signup using your email."),
            //     // subtitle: Text("Radio 1 Subtitle"),
            //     onChanged: (val) {
            //       print("Radio Tile pressed $val");
            //       setSelectedRadioTile(val);
            //     },
            //   ),
            // ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Phone Number",
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.black87),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Password",
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black87),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            //   child: TextField(
            //       decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     hintText: "Confirm Password",
            //     labelText: "Confirm Password",
            //     labelStyle: TextStyle(color: Colors.black87),
            //     focusedBorder:
            //         OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            //   )),
            // ),
            Container(
                width: w,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (val) {
                                print(" Remember me is $val");
                                setRememberMe(val);
                              },
                            ),
                            Text("Remember me"),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 6,
                        child: Container(
                          margin: const EdgeInsets.only(right: 40),
                          child: TextButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .pushReplacementNamed(Routes.signUpScreen);
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.black54),
                              )),
                        )),
                  ],
                )),

            Container(
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              width: w,
              height: SizeConfig.safeBlockVertical * .07,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.myHomePage, (route) => false);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don'\t have any account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.signUpScreen);
                      },
                      child: Text('Sign Up'))
                ],
              ),
            ),
            SizedBox(
              height: h * .05,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: w,
              height: h * .12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      width: w,
                      height: SizeConfig.safeBlockVertical * .07,
                      child: TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          "assets/g.png",
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      width: w,
                      height: SizeConfig.safeBlockVertical * .07,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "f",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
