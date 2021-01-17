import 'package:json_annotation/json_annotation.dart';
part 'vanue.g.dart';

@JsonSerializable()
class Vanue {
  final int venue_id;
  final String name;
  final String location;
  final String timezone;
  Vanue({this.venue_id, this.name, this.location, this.timezone});
  factory Vanue.fromJson(Map<String, dynamic> json) => _$VanueFromJson(json);
  Map<String, dynamic> toJson() => _$VanueToJson(this);
}
