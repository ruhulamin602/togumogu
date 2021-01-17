// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    match_id: json['match_id'] as int,
    title: json['title'] as String,
    short_title: json['short_title'] as String,
    subtitle: json['subtitle'] as String,
    format: json['format'] as String,
    format_str: json['format_str'] as String,
    status: json['status'] as String,
    status_str: json['status_str'] as String,
    status_note: json['status_note'] as String,
    verified: json['verified'] as String,
    pre_squad: json['pre_squad'] as String,
    odds_available: json['odds_available'] as String,
    game_state: json['game_state'] as String,
    game_state_str: json['game_state_str'] as String,
    domestic: json['domestic'] as String,
    competition: json['competition'] as String,
    teama: json['teama'] == null
        ? null
        : Team.fromJson(json['teama'] as Map<String, dynamic>),
    teamb: json['teamb'] == null
        ? null
        : Team.fromJson(json['teamb'] as Map<String, dynamic>),
    venue: json['venue'] == null
        ? null
        : Vanue.fromJson(json['venue'] as Map<String, dynamic>),
    toss: json['toss'] == null
        ? null
        : Toss.fromJson(json['toss'] as Map<String, dynamic>),
    date_start: json['date_start'] as String,
    date_end: json['date_end'] as String,
    timestamp_start: json['timestamp_start'] as String,
    timestamp_end: json['timestamp_end'] as String,
    umpires: json['umpires'] as String,
    referee: json['referee'] as String,
    equation: json['equation'] as String,
    live: json['live'] as String,
    result: json['result'] as String,
    result_type: json['result_type'] as String,
    win_margin: json['win_margin'] as String,
    winning_team_id: json['winning_team_id'] as String,
    commentary: json['commentary'] as String,
    wagon: json['wagon'] as String,
    latest_inning_number: json['latest_inning_number'] as String,
  );
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'match_id': instance.match_id,
      'title': instance.title,
      'short_title': instance.short_title,
      'subtitle': instance.subtitle,
      'format': instance.format,
      'format_str': instance.format_str,
      'status': instance.status,
      'status_str': instance.status_str,
      'status_note': instance.status_note,
      'verified': instance.verified,
      'pre_squad': instance.pre_squad,
      'odds_available': instance.odds_available,
      'game_state': instance.game_state,
      'game_state_str': instance.game_state_str,
      'domestic': instance.domestic,
      'competition': instance.competition,
      'teama': instance.teama?.toJson(),
      'teamb': instance.teamb?.toJson(),
      'venue': instance.venue?.toJson(),
      'toss': instance.toss?.toJson(),
      'date_start': instance.date_start,
      'date_end': instance.date_end,
      'timestamp_start': instance.timestamp_start,
      'timestamp_end': instance.timestamp_end,
      'umpires': instance.umpires,
      'referee': instance.referee,
      'equation': instance.equation,
      'live': instance.live,
      'result': instance.result,
      'result_type': instance.result_type,
      'win_margin': instance.win_margin,
      'winning_team_id': instance.winning_team_id,
      'commentary': instance.commentary,
      'wagon': instance.wagon,
      'latest_inning_number': instance.latest_inning_number,
    };
