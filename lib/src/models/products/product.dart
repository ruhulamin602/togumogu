import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:togumogu/src/models/products/p_category.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  int id;
  String datetime;
  String name;
  String slug;
  String sku;
  int price;
  int quantity;
  String image;
  int special_price;
  String special_start_date;
  String special_end_date;

  Product(
      {this.slug,
      this.id,
      this.image,
      this.price,
      this.datetime,
      this.name,
      this.quantity,
      this.sku,
      this.special_end_date,
      this.special_price,
      this.special_start_date});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
