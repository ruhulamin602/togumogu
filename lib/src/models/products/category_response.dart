import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:togumogu/src/models/products/p_category.dart';
part 'category_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryResponse {
  final List<Category> data;
  CategoryResponse({
    this.data,
  });
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
