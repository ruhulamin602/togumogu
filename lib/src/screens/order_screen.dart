import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double h = SizeConfig.safeBlockVertical;
    double w = SizeConfig.safeBlockHorizontal;

    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 241, 245, 1),
      appBar: AppBar(
        title: AutoSizeText("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            userAddressInput(context, h),
            sendAsGift(context),
            cuponInputArea(context),
            paymentCalculatinArea(context),
          ],
        )),
      ),
      bottomNavigationBar: navigtionBarOfCheckout(context),
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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
          SizedBox(
            height: 20,
          )
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

  Container sendAsGift(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CheckboxListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            tileColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.amber,
                  ),
                ),
                AutoSizeText(
                  "Send as Gift",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            value: true,
            onChanged: (v) => UnimplementedError()),
      ),
    );
  }

  Container userAddressInput(BuildContext context, double h) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.add_location_alt_sharp),
              AutoSizeText(
                "Address",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () => UnimplementedError(),
                child: AutoSizeText(
                  "Confirm",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
              ),
            ],
          ),
          Container(
            height: h * .06,
            child: Row(
              children: [
                addressField(5, "House"),
                addressField(7, "State"),
              ],
            ),
          ),
          Container(
            height: h * .06,
            child: Row(
              children: [
                addressField(12, "Post Code"),
                addressField(11, "City"),
              ],
            ),
          ),
          Container(
            height: h * .06,
            child: Row(
              children: [
                addressField(14, "Coun"),
                addressField(13, "State"),
              ],
            ),
          ),
          Container(
            height: h * .06,
            child: Row(
              children: [
                addressField(1, "Thana"),
                // addressField(24, "State"),
              ],
            ),
          ),
          
          Container(
            height: h * .06,
            child: Row(
              children: [
                Icon(Icons.phone),
                addressField(22, "O1700000000"),
                Row(
                  children: [
                    Checkbox(
                        value: true,
                        onChanged: (onChanged) => UnimplementedError()),
                    AutoSizeText("Different Billing Address")
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container navigtionBarOfCheckout(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(-2, 0),
                blurRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
              flex: 3,
              child: AutoSizeText(
                "Total: 4200 taka",
                minFontSize: 16,
                style: Theme.of(context).textTheme.headline6,
              )),
          Flexible(
            flex: 3,
            child: ElevatedButton(
              child: AutoSizeText(
                "Confirm",
                minFontSize: 16,
              ),
              onPressed: () => null,
            ),
          )
        ],
      ),
    );
  }

  addressField(
    int flex,
    String hintText,
  ) {
    return Flexible(
      flex: flex,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.grey.shade300, style: BorderStyle.none),
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            contentPadding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.grey.shade300, style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.grey.shade300, style: BorderStyle.none),
            ),
            hintText: hintText,
          ),
        ),
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
}
