import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:togumogu/src/bloc/article/category_cubit.dart';
import 'package:togumogu/src/bloc/article/product_cubit.dart';
import 'package:togumogu/src/bloc/article/result_state.dart';
import 'package:togumogu/src/models/products/p_category.dart';
import 'package:togumogu/src/models/products/product.dart';
import 'package:togumogu/src/screens/category_wise_product.dart';

import 'package:togumogu/src/services/network_exceptions.dart';
import 'package:togumogu/src/widgets/app_slider.dart';
import 'package:togumogu/src/widgets/product_card.dart';

import 'detailspage.dart';

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  void initState() {
    BlocProvider.of<CategoyCubit>(context).loadCategories();

    super.initState();
  }

  Category subCategory;
  String slug = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoyCubit, ResultState<List<Category>>>(
      builder: (BuildContext context, ResultState<List<Category>> state) {
        return state.when(
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
          idle: () {
            return Container();
          },
          data: (List<Category> data) {
            subCategory = data.first;
            slug = data.first.slug;
            return Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical,
              // margin: EdgeInsets.only(top: 20, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .24,
                    height: MediaQuery.of(context).size.height * .80,
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(3, 0),
                            blurRadius: 1,
                            spreadRadius: 1)
                      ],
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: data
                            .map(
                              (e) => GestureDetector(
                                onTap: () => {
                                  setState(() {
                                    subCategory = e;
                                    slug = e.slug;
                                  }),
                                  BlocProvider.of<ProductCubit>(context)
                                      .loadCatWiseProd(slug),
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      e.name,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  // body part...
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * .70,
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10))),
                            centerTitle: false,
                            elevation: 2,
                            automaticallyImplyLeading: false,
                            primary: false,
                            floating: false,
                            pinned: true,
                            title: Container(
                              child: Container(
                                width: MediaQuery.of(context).size.width * .52,
                                height:
                                    MediaQuery.of(context).size.height * .05,
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: TextField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      fillColor: Colors.white38,
                                      focusColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(),
                                      hintText: "Search here...",
                                      suffixIcon: Icon(
                                        Icons.search_sharp,
                                        color: Colors.grey,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 0,
                                  right: 20,
                                ),
                                child: Icon(Icons.shopping_cart_outlined),
                              )
                            ],
                          ),
                          SliverToBoxAdapter(
                              child: Container(
                                  padding: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: AppSlider())),
                          SliverPadding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                subCategory?.children == null
                                    ? ""
                                    : subCategory?.name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          SliverGrid.count(
                            crossAxisCount: 3,
                            children: subCategory?.children != null
                                ? subCategory.children
                                    .map((e) => GestureDetector(
                                          onTap: () => {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CategoryWiseProduct(
                                                  category: e,
                                                ),
                                              ),
                                            ),
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(2.5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.grey.shade400,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            height: 100,
                                            width: 100,
                                            child: Center(
                                                child: Text(
                                              e.name ?? "",
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                        ))
                                    .toList()
                                : [],
                          ),
                          SliverPadding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            sliver: SliverToBoxAdapter(
                              child: Text(
                                "Products",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ),
                          BlocBuilder<ProductCubit, ResultState<List<Product>>>(
                            builder: (BuildContext context,
                                ResultState<List<Product>> state) {
                              return state.when(
                                loading: () {
                                  return SliverFillRemaining(
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                },
                                idle: () {
                                  return SliverToBoxAdapter(child: Container());
                                },
                                data: (List<Product> product) {
                                  return SliverStaggeredGrid.countBuilder(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    staggeredTileBuilder: (i) {
                                      return new StaggeredTile.count(
                                          1, i.isEven ? 1.55 : 1.45);
                                    },
                                    itemBuilder: (context, i) {
                                      return GestureDetector(
                                        //When user click the card
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                        color: Colors.white,
                                                        product: product[i],
                                                      )));
                                        },
                                        child: productCard(
                                            product[i],
                                            i,
                                            Colors.white,
                                            MediaQuery.of(context).size.height,
                                            MediaQuery.of(context).size.width),
                                      );
                                    },
                                    itemCount: product.length,
                                  );
                                },
                                error: (NetworkExceptions error) {
                                  return SliverToBoxAdapter(
                                    child: Center(
                                      child: AspectRatio(
                                        aspectRatio: 3.2,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Card(
                                            elevation: 0,
                                            child: Center(
                                              child: Text(
                                                NetworkExceptions
                                                    .getErrorMessage(error),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ))
                ],
              ),
            );
          },
          error: (NetworkExceptions error) {
            return Center(
              child: AspectRatio(
                aspectRatio: 3.2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 0,
                    child: Center(
                      child: Text(
                        NetworkExceptions.getErrorMessage(error),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
