import 'package:json_annotation/json_annotation.dart';
part 'p_category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final int id;
  final String name;
  final String slug;
  final List<Category> children;
  Category({
    this.id,
    this.name,
    this.slug,
    this.children,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
  
}
