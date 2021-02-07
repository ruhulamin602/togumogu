import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        padding: EdgeInsets.symmetric(vertical: h * .005, horizontal: 20),
        width: w,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
                    title: "Shopping",
                    icon: Icons.shopping_bag,
                    context: context,
                    routeName: "/shopping-screen"
                  ),
                  // Navigator.of(context)
                  //     .pushNamed(route.Routes.shoppingScreen),

                  buildMenuItem(
                      w: w,
                      h: h,
                      color: Color.fromRGBO(202, 197, 255, 1),
                      title: "Parenting Guid",
                      icon: Icons.family_restroom_outlined),
                  buildMenuItem(
                      w: w,
                      h: h,
                      color: Color.fromRGBO(255, 172, 172, 1),
                      title: "Camera",
                      icon: Icons.camera),
                  buildMenuItem(
                      w: w,
                      h: h,
                      color: Color.fromRGBO(211, 226, 211, 1),
                      title: "Shopping",
                      icon: Icons.shopping_bag_outlined)
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
                    title: "Madicine",
                    icon: Icons.medical_services_outlined),
                buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(151, 226, 198, 1),
                    title: "Places for Kids",
                    icon: Icons.place_sharp),
                buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(78, 185, 241, 1),
                    title: "Service",
                    icon: Icons.home_repair_service_outlined),
                buildMenuItem(
                    w: w,
                    h: h,
                    color: Color.fromRGBO(94, 114, 235, 1),
                    title: "Madicine",
                    icon: Icons.medical_services),
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
  String routeName,
  IconData icon,
}) {
  return Container(
      height: h * .11,
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
                ]),
            child: CircleAvatar(
              backgroundColor: color,
              minRadius: w * .07,
              maxRadius: w * .07,
              child: IconButton(
                onPressed: () {
                 routeName!=null? Navigator.of(context).pushNamed(routeName):print(title);
                },
                icon: Icon(icon),
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Container(
                width: w * .20,
                height: h * 0.02,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: h * .014, fontWeight: FontWeight.w500),
                  softWrap: true,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: true),
                )),
          ),
        ],
      ));
}
