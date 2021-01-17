import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/models/articles/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'featured_article_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FeaturedArticleResponse {
  final Articles data;
  final Meta meta;

  FeaturedArticleResponse(this.data, this.meta);
  factory FeaturedArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$FeaturedArticleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedArticleResponseToJson(this);
}