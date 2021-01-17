import 'package:json_annotation/json_annotation.dart';
part 'toss.g.dart';

@JsonSerializable()
class Toss {
  final String text;
  final String winner;
  final String decision;
  Toss({this.winner, this.decision, this.text});
  factory Toss.fromJson(Map<String, dynamic> json) => _$TossFromJson(json);
  Map<String, dynamic> toJson() => _$TossToJson(this);
}
