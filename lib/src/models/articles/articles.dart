import 'package:json_annotation/json_annotation.dart';
import 'package:togumogu/src/models/articles/category.dart';
part 'articles.g.dart';

@JsonSerializable(explicitToJson: true)
class Articles {
  final String title;
  final String slug;
  final List<Category> category;

  final String image;
  final String date;
  final String photo_credit;
  final String reporter;

  Articles(
      {this.title,
      this.slug,
      this.category,
      this.image,
      this.date,
      this.photo_credit,
      this.reporter});
  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
