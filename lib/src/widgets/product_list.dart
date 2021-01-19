import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:togumogu/src/models/fruit_model.dart';
import 'package:togumogu/src/screens/detailspage.dart';
import 'package:togumogu/src/widgets/product_card.dart';


Container buildSliverToBoxAdapterForProducts(double w, double h) {
  return Container(
    height: w * (1.45 + 1.5) * .49,
    width: w,
    margin: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
    child:StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      shrinkWrap: false,
      primary: false,
      crossAxisCount: 2,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      itemCount: fruitsData.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          //When user click the card
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                      color: Colors.white,
                      fruitModel: fruitsData[i],
                    )));
          },
          child: productCard(fruitsData[i], i, Colors.white, w, h),
        );
      },
      staggeredTileBuilder: (i) {
        return new StaggeredTile.count(1, i.isEven ? 1.5 : 1.45);
      },
    ),
  );
}
