// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedArticleResponse _$FeaturedArticleResponseFromJson(
    Map<String, dynamic> json) {
  return FeaturedArticleResponse(
    json['data'] == null
        ? null
        : Articles.fromJson(json['data'] as Map<String, dynamic>),
    json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeaturedArticleResponseToJson(
        FeaturedArticleResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'meta': instance.meta?.toJson(),
    };
