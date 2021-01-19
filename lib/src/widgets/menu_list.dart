import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container buildSliverToBoxAdapterForMenuList(double w, double h) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: h*.01, horizontal: 20),
      width: w ,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(0, 1),
                blurRadius: 2.0,
                spreadRadius: 2.0)
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
                buildMenuItem(w, h, Color.fromRGBO(196, 241, 144, 1),
                    "Shopping", Icons.shopping_bag),
                buildMenuItem(w, h, Color.fromRGBO(202, 197, 255, 1),
                    "Parenting Guid", Icons.family_restroom_outlined),
                buildMenuItem(w, h, Color.fromRGBO(255, 172, 172, 1),
                    "Camera", Icons.camera),
                buildMenuItem(w, h, Color.fromRGBO(211, 226, 211, 1),
                    "Shopping", Icons.shopping_bag_outlined)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildMenuItem(w, h, Color.fromRGBO(94, 114, 235, 1), "Madicine",
                  Icons.medical_services_outlined),
              buildMenuItem(w, h, Color.fromRGBO(151, 226, 198, 1),
                  "Places for Kids", Icons.place_sharp),
              buildMenuItem(w, h, Color.fromRGBO(78, 185, 241, 1), "Service",
                  Icons.home_repair_service_outlined),
              buildMenuItem(w, h, Color.fromRGBO(94, 114, 235, 1), "Madicine",
                  Icons.medical_services),
            ],
          )
        ],
      ));
}
Container buildMenuItem(
      double w, double h, Color color, String title, IconData icon) {
    return Container(
        height: h * .10,
        margin: EdgeInsets.symmetric(vertical: h*.008),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.grey.shade200,
                        blurRadius: 3,
                        spreadRadius: 2)
                  ]),
              child: CircleAvatar(
                backgroundColor: color,
                minRadius: w * .07,
                maxRadius: w * .07,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(icon),
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
                width: w * .20,
                height: h*0.015,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: h * .013, fontWeight: FontWeight.w500),
                  softWrap: true,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )),
          ],
        ));
  }