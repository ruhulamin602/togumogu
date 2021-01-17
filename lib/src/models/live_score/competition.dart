import 'package:json_annotation/json_annotation.dart';
part 'competition.g.dart';

@JsonSerializable()
class Competition {
  final int cid;
  final String title;
  final String abbr;
  final String type;
  final String category;
  // ignore: non_constant_identifier_names
  final String match_format;
  final String status;
  final String season;
  final String datestart;
  final String dateend;
  // ignore: non_constant_identifier_names
  final String total_matches;
  // ignore: non_constant_identifier_names
  final String total_rounds;
  // ignore: non_constant_identifier_names
  final String total_teams;
  final String country;
  // ignore: non_constant_identifier_names
  Competition({
    this.cid,
    this.title,
    this.abbr,
    this.type,
    this.category,
    this.match_format,
    this.status,
    this.season,
    this.datestart,
    this.dateend,
    this.total_matches,
    this.total_rounds,
    this.total_teams,
    this.country,
  });
  factory Competition.fromJson(Map<String, dynamic> json) =>
      _$CompetitionFromJson(json);
  Map<String, dynamic> toJson() => _$CompetitionToJson(this);
}
