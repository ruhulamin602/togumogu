import 'package:json_annotation/json_annotation.dart';
import 'package:togumogu/src/models/live_score/livescore.dart';
part 'livescoreresponse.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveScoreResponse {
  final String status;
  final LiveScore response;
  final String etag;
  final String modified;
  final String datetime;
  final String api_version;
  LiveScoreResponse({
    this.status,
    this.response,
    this.etag,
    this.modified,
    this.datetime,
    this.api_version,
  });
  factory LiveScoreResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveScoreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LiveScoreResponseToJson(this);
}
