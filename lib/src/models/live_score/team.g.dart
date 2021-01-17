// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
    team_id: json['team_id'] as int,
    name: json['name'] as String,
    short_name: json['short_name'] as String,
    logo_url: json['logo_url'] as String,
    scores_full: json['scores_full'] as String,
    scores: json['scores'] as String,
    overs: json['overs'] as String,
  );
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'team_id': instance.team_id,
      'name': instance.name,
      'short_name': instance.short_name,
      'logo_url': instance.logo_url,
      'scores_full': instance.scores_full,
      'scores': instance.scores,
      'overs': instance.overs,
    };
