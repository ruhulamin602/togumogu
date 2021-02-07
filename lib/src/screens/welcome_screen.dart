import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/routes/router.gr.dart';
import 'package:togumogu/src/screens/home/home.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentIndex = 0;
  List<Widget> icons = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 200,
              child: Image.asset(
                  'assets/images/welcome' + 1.toString() + '.png',
                  fit: BoxFit.cover)),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "This is the Title " + 1.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 250,
            child: Text(
              "Description fhdjkah jkdhf jkdhfjdhfjd fdhfjkhdfhd fdjdhfoailrioe hfdfkl dfj" +
                  1.toString(),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 200,
              child: Image.asset(
                  'assets/images/welcome' + 2.toString() + '.png',
                  fit: BoxFit.cover)),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("This is the Title " + 2.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            width: 250,
            child: Text(
              "Description djfkdja kdjfkldaj lkdjf alkdfjdfjklajdfl djfkdj" +
                  2.toString(),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 200,
              child: Image.asset(
                'assets/images/welcome' + 3.toString() + '.png',
                fit: BoxFit.cover,
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("This is the Title " + 3.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            width: 250,
            child: Text(
              "Description djhfjklda jkdhfjkd ahfjk dkjfhjkdh ffikdhj" +
                  2.toString(),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 200,
              child: Image.asset(
                  'assets/images/welcome' + 1.toString() + '.png',
                  fit: BoxFit.cover)),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("This is the Title " + 4.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            width: 250,
            child: Text(
              "Description hfjdh jhfd jkhfk fdjkhfjkdh  fhd djkfh" +
                  4.toString(),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    )
  ];
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex + 1 >= icons.length) {
            _currentIndex = 0;
          } else {
            _currentIndex = _currentIndex + 1;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textStyle = TextStyle(fontSize: 20);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/images/togumogu.png"),
              width: SizeConfig.safeBlockHorizontal * .3,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * .06,
            ),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(child: child, opacity: animation);
                  },
                  child: icons[_currentIndex],
                  key: ValueKey<int>(_currentIndex),
                ),
              ),
            ),
            buildIndicator(),
            Container(
                width: SizeConfig.safeBlockHorizontal * .7,
                height: SizeConfig.safeBlockVertical * .06,
                child: ElevatedButton(
                     onPressed: () {
                      Navigator.of(context).pushNamed(Routes.signUpScreen);
                    },
                    child: Text(
                      "Signup",
                      style: textStyle,
                    ))),
            SizedBox(
              height: 20,
            ),
            Container(
                width: SizeConfig.safeBlockHorizontal * .7,
                height: SizeConfig.safeBlockVertical * .06,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.loginScreen);
                    },
                    child: Text(
                      "Login",
                      style: textStyle,
                    ))),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don\'t have any account?"),
                  TextButton(onPressed: () {}, child: Text('Signup'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildIndicator() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: 100,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 0 ? Colors.blueAccent : Colors.grey.shade300,
            ),
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 1 ? Colors.blueAccent : Colors.grey.shade300,
            ),
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 2 ? Colors.blueAccent : Colors.grey.shade300,
            ),
          ),
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == 3 ? Colors.blueAccent : Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
