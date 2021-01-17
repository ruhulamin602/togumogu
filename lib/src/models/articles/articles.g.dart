// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) {
  return Articles(
    title: json['title'] as String,
    slug: json['slug'] as String,
    category: (json['category'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    image: json['image'] as String,
    date: json['date'] as String,
    photo_credit: json['photo_credit'] as String,
    reporter: json['reporter'] as String,
  );
}

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'category': instance.category?.map((e) => e?.toJson())?.toList(),
      'image': instance.image,
      'date': instance.date,
      'photo_credit': instance.photo_credit,
      'reporter': instance.reporter,
    };
