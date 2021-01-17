
import 'package:json_annotation/json_annotation.dart';
import 'package:togumogu/src/models/live_score/team.dart';
import 'package:togumogu/src/models/live_score/toss.dart';
import 'package:togumogu/src/models/live_score/vanue.dart';

part 'items.g.dart';

@JsonSerializable(explicitToJson: true)
class Items {
  final int match_id;
  final String title;
  final String short_title;
  final String subtitle;
  final String format;
  final String format_str;
  final String status;
  final String status_str;
  final String status_note;
  final String verified;
  final String pre_squad;
  final String odds_available;
  final String game_state;
  final String game_state_str;
  final String domestic;
  final String competition;
  final Team teama;
  final Team teamb;
  final Vanue venue;
  final Toss toss;
  final String date_start;
  final String date_end;
  final String timestamp_start;
  final String timestamp_end;
  final String umpires;
  final String referee;
  final String equation;
  final String live;
  final String result;
  final String result_type;
  final String win_margin;
  final String winning_team_id;
  final String commentary;
  final String wagon;
  final String latest_inning_number;
  Items({
    this.match_id,
    this.title,
    this.short_title,
    this.subtitle,
    this.format,
    this.format_str,
    this.status,
    this.status_str,
    this.status_note,
    this.verified,
    this.pre_squad,
    this.odds_available,
    this.game_state,
    this.game_state_str,
    this.domestic,
    this.competition,
    this.teama,
    this.teamb,
    this.venue,
    this.toss,
    this.date_start,
    this.date_end,
    this.timestamp_start,
    this.timestamp_end,
    this.umpires,
    this.referee,
    this.equation,
    this.live,
    this.result,
    this.result_type,
    this.win_margin,
    this.winning_team_id,
    this.commentary,
    this.wagon,
    this.latest_inning_number,
  });
  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
