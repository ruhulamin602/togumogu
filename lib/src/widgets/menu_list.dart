import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/appbar/tabbar_index_change.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key key,
    this.w,
    this.h,
  }) : super(key: key);
  final double w;
  final double h;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: h * .003, horizontal: 15),
        width: w,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, 2),
                  blurRadius: 1.0,
                  spreadRadius: 1.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: h*.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                
                children: [
                  buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(
                      196,
                      241,
                      144,
                      1,
                    ),
                    title: "Shop Now",
                    icon:  Image.asset("assets/images/shop-now.png"),
                    context: context,
                  ),
                  // Navigator.of(context)
                  //     .pushNamed(route.Routes.shoppingScreen),

                  buildMenuItem(
                      w: w,
                      h: h,
                      color: Color.fromRGBO(202, 197, 255, 1),
                      title: "Parenting Guide",
                      icon: Image.asset("assets/images/parenting-guide.png")),
                  buildMenuItem(
                      w: w,
                      h: h,
                      color: Color.fromRGBO(255, 172, 172, 1),
                      title: "Baby Photography",
                      icon: Image.asset("assets/images/Baby-Photography.png")),
                  buildMenuItem(
                      w: w,
                      h: h,
                      color: Color.fromRGBO(211, 226, 211, 1),
                      title: "Babysitter",
                      icon: Image.asset("assets/images/babysitter.png",fit: BoxFit.scaleDown,))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(94, 114, 235, 1),
                    title: "Kids Creative Course",
                    icon: Image.asset("assets/images/Kids-Creative-Course.png")),
                buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(151, 226, 198, 1),
                    title: "Parenting Course",
                    icon: Image.asset("assets/images/Parenting-Course.png")),
                buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(78, 185, 241, 1),
                    title: "Videos",
                    icon: Image.asset("assets/images/Videos.png")),
                buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(94, 114, 235, 1),
                    title: "More",
                    icon: Image.asset("assets/images/More.png"),),
              ],
            )
          ],
        ));
  }
}

buildMenuItem({
  BuildContext context,
  double w,
  double h,
  Color color,
  String title,
  Widget icon,
}) {
  return Container(
    height: h * .13,
    margin: EdgeInsets.symmetric(vertical: h * .008),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.grey.shade200.withOpacity(.5),
                  blurRadius: 1,
                  spreadRadius: 1)
            ],
          ),
          child: CircleAvatar(
            backgroundColor: color,
            minRadius: w * .07,
            maxRadius: w * .07,
            child: IconButton(
              onPressed: () {
                BlocProvider.of<TabbarBloc>(context, listen: false)
                    .getSecondIndex(1);
                BlocProvider.of<TabbarBloc>(context, listen: false)
                    .add(TabbarEvent.onTap);

                print(BlocProvider.of<TabbarBloc>(context)
                    .setSecondIndex
                    .toString());
              },
              icon: Container(child: icon),
              color: Colors.black54,
            ),
          ),
        ),
        FittedBox(
          child: Container(
              width: w * .20,
              height: h * 0.035,
              child: Text(
                title,
                style:
                    TextStyle(fontSize: h * .015, fontWeight: FontWeight.w500),
                softWrap: true,
                textAlign: TextAlign.center,
                maxLines: 2,
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: true),
              )),
        ),
      ],
    ),
  );
}
