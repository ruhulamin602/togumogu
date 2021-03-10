import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 241, 245, 1),
      appBar: AppBar(
        title: AutoSizeText("Checkout"),
      ),
      body: Center(
        child: Container(
          child: Text("It\'s order Screen"),
        ),
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }
}
