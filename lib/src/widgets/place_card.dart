import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/models/fruit_model.dart';

Widget buildSliverFixedExtentListOfPlaces(
      double h, double w, int length) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      itemExtent: h * .26, // I'm forcing item heights
      itemBuilder: 
        (context, index) => ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: null,
          title: Card(
            elevation: 4,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    width: w * .40,
                    height: h * .25,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Image.asset(
                      fruitsData[index].image,
                      fit: BoxFit.cover,
                      width: w * .40,
                    ))),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          fruitsData[index].name,
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: w * .4,
                        padding: EdgeInsets.symmetric(vertical: 0),
                        child: Text(
                          fruitsData[index].description,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 4,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: h*.01),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0, left: 0),
                              child: Icon(
                                Icons.location_on_sharp,
                                size: 20,
                              ),
                            ),
                            Container(
                              width: w * .4,
                              padding: EdgeInsets.symmetric(
                                  vertical: h*.004, horizontal: w*.01),
                              child: Text(
                                "This palace is at Dhaka city. It\'s a great place to visit",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 14.0,
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
              ],
            ),
          ),
        ),
        itemCount:length,
      
    );
  }