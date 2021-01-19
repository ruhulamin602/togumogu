import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tracker extends StatelessWidget {
  const Tracker({
    Key key,
    @required this.w,
    @required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: h * 0.005),
        height: h * .13,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
        ),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 2,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(h * .008),
                  padding: EdgeInsets.all(h * .004),
                  width: w * .24,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 90, 90, 1),
                        Color.fromRGBO(108, 164, 249, 1)
                      ],
                      stops: [0, .8],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Image.asset(
                    "assets/tracking.png",
                  )),
                ),
                Container(
                  width: w * .65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: w * 0.01),
                          child: Text(
                            "Week 16 Day 13",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                        child: Text(
                          "At this age your child need more care then ever.",
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
