import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:togumogu/src/models/fruit_model.dart';

Widget buildSliverFixedExtentListOfArticles(double h, double w, int length) {
  return ListView.builder(
    padding: EdgeInsets.all(0),
    physics: NeverScrollableScrollPhysics(),
    itemExtent: h * .21, // I'm forcing item heights
    itemBuilder: (context, index) => ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: null,
      title: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                width: w * .38,
                height: h * .20,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Image.asset(
                  fruitsData[index].image,
                  fit: BoxFit.cover,
                  width: w * .38,
                ))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: w * .005),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: h * .01),
                    child: Text(
                      fruitsData[index].name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: w * .4,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      fruitsData[index].description,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.normal),
                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    width: w * .4,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      fruitsData[index].price.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    itemCount: length,
  );
}
