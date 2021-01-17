import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:palette_generator/palette_generator.dart';
import 'package:togumogu/src/models/fruit_model.dart';

Widget card(FruitModel fruitModel, int i, List<PaletteColor> colors, double w,
    double h) {
  return new Container(
    // margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: w * .42,
              margin: EdgeInsets.only(top: 5, left: 5, right: 5),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.cyan[100],
                  borderRadius: BorderRadius.circular(10)),
              child: Hero(
                tag: fruitModel,
                child: Image.asset(fruitModel.image),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                color: Colors.red,
                child: Text("-10%"),
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                fruitModel.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "৳ ${fruitModel.price}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "৳ ${fruitModel.price}",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 10,
                  ),
                  Icon(
                    Icons.star,
                    size: 10,
                  ),
                  Icon(
                    Icons.star,
                    size: 10,
                  ),
                  Icon(
                    Icons.star,
                    size: 10,
                  ),
                  Icon(
                    Icons.star_half,
                    size: 10,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
