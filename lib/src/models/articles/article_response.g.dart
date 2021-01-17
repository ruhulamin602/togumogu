// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return ArticleResponse(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Articles.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ArticleResponseToJson(ArticleResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'meta': instance.meta?.toJson(),
    };
