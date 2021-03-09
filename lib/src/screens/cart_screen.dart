import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        primary: false,
        backgroundColor: Color.fromRGBO(239, 241, 245, 1),
        appBar: AppBar(
          // flexibleSpace: Container(),
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          primary: false,
          
          
          
        ),
        body: Container(
          child: Column(
            children: [
              cartTile(),
              cartTile(),
              cartTile(),
            ],
          ),
        ),
      ),
    );
  }

  Container cartTile() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (v) => print(v),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Container(
              height: 60,
              width: 60,
              color: Colors.redAccent,
              child: Placeholder(
                color: Colors.transparent,
              ),
            ),
          ),
          // ClipRRect(child: CachedNetworkImage(imageUrl: null,),),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 2.5),
                  child: AutoSizeText(
                    "Product Titile",
                    minFontSize: 16,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: AutoSizeText("1500 TK",
                      minFontSize: 13,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.amber)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.5),
                  child: AutoSizeText("1700 Tk",
                      minFontSize: 10,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.5),
                  child: RatingBarIndicator(
                    rating: 4.5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 10.0,
                    direction: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                        child: AutoSizeText(
                          '3 Sold',
                          minFontSize: 10,
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade300),
                        child: AutoSizeText(
                          'In Stock',
                          minFontSize: 10,
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.transparent,
                height: 30,
                width: 30,
                child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 15,
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: () => print("added")),
              ),
              Container(
                color: Colors.grey.shade200,
                height: 30,
                width: 30,
                child: Center(
                  child: AutoSizeText(
                    "1",
                    minFontSize: 13,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 30,
                width: 30,
                child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 15,
                    icon: Icon(
                      Icons.remove,
                    ),
                    onPressed: () => print("removed")),
              ),
              Padding(padding: EdgeInsets.all(5))
            ],
          )
        ],
      ),
    );
  }
}
