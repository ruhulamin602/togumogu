import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:togumogu/src/models/products/product.dart';

Widget productCard(Product product, int i, Color color, double w, double h) {
  return new Container(
    margin: new EdgeInsets.all(0),
    padding: new EdgeInsets.symmetric(vertical: 10),
    decoration: new BoxDecoration(
      color: color,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 12,
          child: Stack(
            children: [
              Container(
                // width: w * .40,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Hero(
                    tag: product.id,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                    color: Colors.red.withOpacity(.9),
                  ),
                  child: AutoSizeText(
                    "-10%",
                    minFontSize: 12,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: AutoSizeText(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 12,
                    wrapWords: true,
                    softWrap: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: AutoSizeText(
                    "৳ ${(product.price.toInt() - product.price.toInt() * .1).toInt()}",
                    minFontSize: 14,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: AutoSizeText(
                    "৳ ${product.price}",
                    // minFontSize: 12,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: RatingBarIndicator(
                        rating: 4.25,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 12.0,
                        direction: Axis.horizontal,
                      ),
                    ),
                    
                    AutoSizeText(
                      "4.25",
                      minFontSize: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
