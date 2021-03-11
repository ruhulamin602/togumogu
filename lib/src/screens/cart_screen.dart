import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:togumogu/src/widgets/product_list.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;
    return Container(
      child: Column(
        children: [
          AppBar(
            centerTitle: false,
            primary: false,
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          //Cart list
          Container(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  cartTile(),
                  cartTile(),
                  cartTile(),
                ],
              ),
            ),
          ),

          // cuponInputArea(context),
          buildTitle("Suggested Products", () => null),
          ProductList(
            h: h,
            w: w,
            slug: "togumogu-Authentic-Baby-Products-brand",
          ),
          // paymentCalculatinArea(context),
        ],
      ),
    );
  }

  paymentCalculatinArea(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(

            padding: const EdgeInsets.symmetric(vertical:15, horizontal: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.money_sharp),
                ),
                AutoSizeText(
                  "Payment",
                  style: Theme.of(context).textTheme.headline5,
                )
              ],
            ),
          ),
          titleTOMoneyMap(context, Colors.black87, "Subtotal", "TK 3200"),
          titleTOMoneyMap(context, Colors.black87, "Discount", "TK 200"),
          titleTOMoneyMap(context, Colors.black87, "Shiping", "TK 1200"),
          titleTOMoneyMap(context, Colors.amber, "Total", "TK 4200"),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Container titleTOMoneyMap(
      BuildContext context, Color color, String title, String money) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: color),
          ),
          AutoSizeText(
            money,
            style: Theme.of(context).textTheme.bodyText1.copyWith(color: color),
          ),
        ],
      ),
    );
  }

  cuponInputArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 15,
            child: Container(
              height: 40,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                    alignLabelWithHint: false,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter your cupon here"),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: ElevatedButton(
                onPressed: () => print("going to apply"),
                child: AutoSizeText("Apply")),
          )
        ],
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

Container buildTitle(String title, Function onPressed) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: EdgeInsets.symmetric(horizontal: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Spacer(),
        IconButton(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            icon: Icon(Icons.arrow_forward),
            onPressed: onPressed ?? null),
      ],
    ),
  );
}
