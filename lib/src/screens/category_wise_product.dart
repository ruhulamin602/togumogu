import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:togumogu/src/bloc/article/product_cubit.dart';
import 'package:togumogu/src/bloc/article/result_state.dart';
import 'package:togumogu/src/models/products/p_category.dart';
import 'package:togumogu/src/models/products/product.dart';
import 'package:togumogu/src/screens/detailspage.dart';
import 'package:togumogu/src/services/network_exceptions.dart';
import 'package:togumogu/src/widgets/app_bar.dart';
import 'package:togumogu/src/widgets/product_card.dart';

class CategoryWiseProduct extends StatefulWidget {
  final Category category;
  CategoryWiseProduct({
    this.category,
  });

  @override
  _CategoryWiseProductState createState() => _CategoryWiseProductState();
}

class _CategoryWiseProductState extends State<CategoryWiseProduct> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context)
        .loadCatWiseProd(widget.category.slug);
    print(widget.category.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        margin: EdgeInsets.all(8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(widget.category.name,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              ),
            ),
            SliverAppBar(
              
              centerTitle: false,
              pinned: true,
              automaticallyImplyLeading: false,
              title: Container(
                width: MediaQuery.of(context).size.width * .67,
                height: MediaQuery.of(context).size.height * .05,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade600),
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Center(child: Icon(Icons.filter_list_rounded)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  height: 30.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.category.children.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.5),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: buildSubSubCategory(context, index),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Suggested Products",
                    style: Theme.of(context).textTheme.headline5,
                  )),
            ),
            BlocBuilder<ProductCubit, ResultState<List<Product>>>(
              builder:
                  (BuildContext context, ResultState<List<Product>> state) {
                return state.when(
                  loading: () {
                    return SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  idle: () {
                    return SliverToBoxAdapter(
                        child: Container(child: Text("Nothing")));
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailsPage(
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
                        itemCount: product.length);
                  },
                  error: (NetworkExceptions error) {
                    return SliverToBoxAdapter(
                      child: Text(
                        NetworkExceptions.getErrorMessage(error),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  buildSubSubCategory(BuildContext context, int i) {
    return GestureDetector(
      onTap: () {
        print(widget.category.children.length.toString());
        BlocProvider.of<ProductCubit>(context)
            .loadCatWiseProd(widget.category.children[i].slug);
      },
      child: Text(widget.category.children[i].name),
    );
  }
}
