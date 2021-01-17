
import 'package:json_annotation/json_annotation.dart';
import 'package:togumogu/src/models/live_score/items.dart';

part 'livescore.g.dart';

@JsonSerializable(explicitToJson: true)
class LiveScore {
  final String total_items;
  final String total_pages;
  final List<Items> items;
  LiveScore(this.total_items, this.total_pages, this.items);
  factory LiveScore.fromJson(Map<String, dynamic> json) =>
      _$LiveScoreFromJson(json);
  Map<String, dynamic> toJson() => _$LiveScoreToJson(this);
}
