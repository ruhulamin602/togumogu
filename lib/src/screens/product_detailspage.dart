import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:togumogu/src/models/products/product.dart';
import 'package:togumogu/src/screens/home_screen_navigator.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';
// import 'package:flutter_svg/svg.dart';

import '../models/fruit_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key key, @required this.product, @required this.color})
      : super(key: key);
  final Product product;
  final Color color;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 241, 245, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  AutoSizeText(
                    "data",
                    maxLines: 1,
                    minFontSize: 16,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: new Stack(
                      children: <Widget>[
                        new IconButton(
                          icon: Icon(Icons.shopping_bag),
                          onPressed: null,
                        ),
                        new Positioned(
                          top: 9,
                          right: 8,
                          child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.green[800]),
                              new Positioned(
                                  top: 4.0,
                                  right: 7.0,
                                  child: new Center(
                                    child: new Text(
                                      "5",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: SizeConfig.safeBlockVertical * .4,
                width: SizeConfig.safeBlockVertical * .4 * 1.2,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade200,
                ),

                //     CarouselSlider(
                //   items:
                //       data.map((article) => SlideCard(article: article)).toList(),
                //   options: CarouselOptions(
                //     viewportFraction: 1.0,
                //     autoPlayInterval: Duration(seconds: 5),
                //     autoPlay: true,
                //     enlargeCenterPage: false,
                //     aspectRatio: 3.2,
                //   ),
                // );

                child: Hero(
                  transitionOnUserGestures: true,
                  tag: widget.product.id,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: SizeConfig.safeBlockVertical * .08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),

                    // height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "${widget.product.name}",
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   "${widget.product.toString()} pc (500g - 700g)",
                          //   style: TextStyle(
                          //       fontSize: 25, color: Colors.green),
                          // ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: SizeConfig.safeBlockVertical * .03,
                            child: Row(
                              children: [
                                RatingBarIndicator(
                                  rating: 4.25,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                AutoSizeText(
                                  "4.25",
                                  minFontSize: 12,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: AutoSizeText(
                                      '${widget.product.quantity} Sold'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: AutoSizeText('In Stock'),
                                )
                              ],
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         FlatButton(
                          //           minWidth: 15,
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(20.0),
                          //               side:
                          //                   BorderSide(color: Colors.black)),
                          //           onPressed: () {},
                          //           child: Icon(Icons.add),
                          //         ),
                          //         Padding(
                          //           padding: const EdgeInsets.only(
                          //               left: 10, right: 10),
                          //           child: Text(
                          //             "$count",
                          //             style: TextStyle(
                          //                 fontSize: 35,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //         ),
                          //         FlatButton(
                          //           minWidth: 15,
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(20.0),
                          //               side:
                          //                   BorderSide(color: Colors.black)),
                          //           onPressed: () {},
                          //           child: Icon(Icons.remove),
                          //         ),
                          //       ],
                          //     ),
                          //     Column(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         Text(
                          //           "\$ ${widget.product.price.toString()}",
                          //           style: TextStyle(
                          //               fontSize: 35,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //         Text(
                          //           "You save: 20%",
                          //           style: TextStyle(
                          //             color: Colors.green,
                          //             fontWeight: FontWeight.bold,
                          //           ),
                          //         )
                          //       ],
                          //     )
                          //   ],
                          // ),

                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              AutoSizeText(
                                "৳${widget.product.price - widget.product.price * .15}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.red.withOpacity(.7)),
                                minFontSize: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AutoSizeText(
                                "৳${widget.product.price} ",
                                minFontSize: 22,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              AutoSizeText(
                                "PRODUCT DETAILS",
                                minFontSize: 17,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AutoSizeText(
                                "INFO",
                                minFontSize: 14,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AutoSizeText(
                                "REVIEWS",
                                minFontSize: 14,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: AutoSizeText(
                                loremIpsum(),
                                softWrap: true,
                                minFontSize: 12,
                              ))
                        ],
                      ),
                    ),
                    // child: ,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.safeBlockVertical*.09,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, -2),
                  blurRadius: 2,
                  spreadRadius: 0)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: SizeConfig.safeBlockHorizontal * .42,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {},
                    child: AutoSizeText(
                      "Buy Now",
                      minFontSize: 18,
                    )),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: SizeConfig.safeBlockHorizontal * .42,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () => UnimplementedError("Not implimented yet",),
                    child: AutoSizeText(
                      "Add to Cart",
                      minFontSize: 18,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
