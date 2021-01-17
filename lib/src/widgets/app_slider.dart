import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/bloc/movie/article_cubit.dart';
import 'package:togumogu/src/bloc/movie/result_state.dart';
import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/services/network_exceptions.dart';
import 'package:togumogu/src/widgets/slide_card.dart';

class LatestNewsSliders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LatestNewsSlidersState();
  }
}

class _LatestNewsSlidersState extends State<LatestNewsSliders> {
  @override
  void initState() {
    context.bloc<ArticleCubit>().loadArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ResultState<List<Articles>>>(
      builder: (BuildContext context, ResultState<List<Articles>> state) {
        return state.when(
          loading: () {
            return Center(child: CircularProgressIndicator());
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
                child: Text(NetworkExceptions.getErrorMessage(error)));
          },
        );
      },
    );
  }
}
