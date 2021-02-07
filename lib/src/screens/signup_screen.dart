import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/resources/icons/my_flutter_app_icons.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isEmailLogin = false;

  @override
  void initState() {
    super.initState();

    _isEmailLogin = false;
  }

  setisEmailLogin(bool val) {
    setState(() {
      _isEmailLogin = val;
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
              child: Text("Please Signup to continue using our app."),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * .02,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Container(
                       padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(

                      value: _isEmailLogin,

                      // subtitle: Text("Radio 1 Subtitle"),
                      onChanged: (val) {
                        print(" IsEmail is $val");
                        setisEmailLogin(val);
                      },
                    ),
                    Text("Signup using your email."),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextField(
                  decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: !_isEmailLogin
                    ? "Enter your Phone Number"
                    : "Enter your email address",
                labelText: !_isEmailLogin ? "Phone Number" : "Email Address",
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextField(
                  decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Password",
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Confirm Password",
                labelText: "Confirm Password",
                labelStyle: TextStyle(color: Colors.black87),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              )),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                width: w,
                height: SizeConfig.safeBlockVertical * .07,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Signup",
                      style: textStyle,
                    ))),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed("/my-home-page");
                      },
                      child: Text('Login'))
                ],
              ),
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
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        width: w,
                        height: SizeConfig.safeBlockVertical * .07,
                        child: TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/g.png",
                            ))),
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                              )))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
