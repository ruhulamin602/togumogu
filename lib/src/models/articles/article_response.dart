
import 'package:json_annotation/json_annotation.dart';
import 'package:togumogu/src/models/articles/articles.dart';
import 'package:togumogu/src/models/articles/meta.dart';

part 'article_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleResponse {
  final List<Articles> data;
  final Meta meta;

  ArticleResponse(this.data, this.meta);
  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}
