import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:togumogu/src/bloc/article/product_cubit.dart';
import 'package:togumogu/src/bloc/article/result_state.dart';
import 'package:togumogu/src/models/products/product.dart';
import 'package:togumogu/src/screens/detailspage.dart';
import 'package:togumogu/src/services/network_exceptions.dart';
import 'package:togumogu/src/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    this.h,
    this.w,
    Key key,
    this.count,
    this.slug,
  }) : super(key: key);
  final double h;
  final double w;
  final int count;
  final String slug;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).loadCatWiseProd(
        widget.slug /**"togumogu-age-appropriate-children-Book"*/);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ResultState<List<Product>>>(
      builder: (BuildContext context, ResultState<List<Product>> state) {
        return state.when(
          loading: () {
            return Center(
              child: AspectRatio(
                aspectRatio: 3.2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 0,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            );
          },
          idle: () {
            return Container();
          },
          data: (List<Product> product) {
            return 
            Container(
              height: widget.w*2.45/2* product.length / 4,
              margin:
                  const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
              child:
               StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 6.0,
                itemCount: widget.count ?? product.length,
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
                        product[i], i, Colors.white, widget.w, widget.h),
                  );
                },
                staggeredTileBuilder: (i) {
                  return new StaggeredTile.count(1, i%2==0 ? 1.35 : 1.25);
                },
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
