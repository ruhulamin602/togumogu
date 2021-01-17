// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livescoreresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveScoreResponse _$LiveScoreResponseFromJson(Map<String, dynamic> json) {
  return LiveScoreResponse(
    status: json['status'] as String,
    response: json['response'] == null
        ? null
        : LiveScore.fromJson(json['response'] as Map<String, dynamic>),
    etag: json['etag'] as String,
    modified: json['modified'] as String,
    datetime: json['datetime'] as String,
    api_version: json['api_version'] as String,
  );
}

Map<String, dynamic> _$LiveScoreResponseToJson(LiveScoreResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response': instance.response?.toJson(),
      'etag': instance.etag,
      'modified': instance.modified,
      'datetime': instance.datetime,
      'api_version': instance.api_version,
    };
