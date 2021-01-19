
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/widgets/sizeconfig.dart';

class SlideCard extends StatelessWidget {
  final Articles article;
  SlideCard({this.article});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      width:SizeConfig.safeBlockHorizontal ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: Colors.white,
        
      ),
      child: ClipRRect(
        
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          article.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

