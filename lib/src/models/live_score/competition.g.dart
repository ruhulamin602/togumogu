// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Competition _$CompetitionFromJson(Map<String, dynamic> json) {
  return Competition(
    cid: json['cid'] as int,
    title: json['title'] as String,
    abbr: json['abbr'] as String,
    type: json['type'] as String,
    category: json['category'] as String,
    match_format: json['match_format'] as String,
    status: json['status'] as String,
    season: json['season'] as String,
    datestart: json['datestart'] as String,
    dateend: json['dateend'] as String,
    total_matches: json['total_matches'] as String,
    total_rounds: json['total_rounds'] as String,
    total_teams: json['total_teams'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$CompetitionToJson(Competition instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'title': instance.title,
      'abbr': instance.abbr,
      'type': instance.type,
      'category': instance.category,
      'match_format': instance.match_format,
      'status': instance.status,
      'season': instance.season,
      'datestart': instance.datestart,
      'dateend': instance.dateend,
      'total_matches': instance.total_matches,
      'total_rounds': instance.total_rounds,
      'total_teams': instance.total_teams,
      'country': instance.country,
    };
