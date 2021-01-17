// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livescore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveScore _$LiveScoreFromJson(Map<String, dynamic> json) {
  return LiveScore(
    json['total_items'] as String,
    json['total_pages'] as String,
    (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LiveScoreToJson(LiveScore instance) => <String, dynamic>{
      'total_items': instance.total_items,
      'total_pages': instance.total_pages,
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };
