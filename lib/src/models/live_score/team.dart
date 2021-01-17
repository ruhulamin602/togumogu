
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';
@JsonSerializable()
class Team {
  final int team_id;
  final String name;
  final String short_name;
  final String logo_url;
  final String scores_full;
  final String scores;
  final String overs;
  Team(
      {this.team_id,
      this.name,
      this.short_name,
      this.logo_url,
      this.scores_full,
      this.scores,
      this.overs});
      factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
