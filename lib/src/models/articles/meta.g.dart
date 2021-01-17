// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    current_page: json['current_page'] as int,
    from: json['from'] as int,
    last_page: json['last_page'] as int,
    path: json['path'] as String,
    per_page: json['per_page'] as int,
    to: json['to'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'from': instance.from,
      'last_page': instance.last_page,
      'path': instance.path,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
    };
