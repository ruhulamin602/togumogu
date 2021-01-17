import 'package:json_annotation/json_annotation.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
  final int current_page;
  final int from;
  final int last_page;
  final String path;
  final int per_page;
  final int to;
  final int total;
  Meta(
      {this.current_page,
      this.from,
      this.last_page,
      this.path,
      this.per_page,
      this.to,
      this.total});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
