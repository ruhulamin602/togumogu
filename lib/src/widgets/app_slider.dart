import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/article/article_cubit.dart';
import 'package:togumogu/src/bloc/article/result_state.dart';
import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/services/network_exceptions.dart';
import 'package:togumogu/src/widgets/slide_card.dart';

class AppSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppSliderState();
  }
}

class _AppSliderState extends State<AppSlider> {
  @override
  void initState() {
    BlocProvider.of<ArticleCubit>(context).loadArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ResultState<List<Articles>>>(
      builder: (BuildContext context, ResultState<List<Articles>> state) {
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
          data: (List<Articles> data) {
            return CarouselSlider(
              items:
                  data.map((article) => SlideCard(article: article)).toList(),
              options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlayInterval: Duration(seconds: 5),
                autoPlay: true,
                enlargeCenterPage: false,
                aspectRatio: 3.2,
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
