// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    slug: json['slug'] as String,
    id: json['id'] as int,
    image: json['image'] as String,
    price: json['price'] as int,
    datetime: json['datetime'] as String,
    name: json['name'] as String,
    quantity: json['quantity'] as int,
    sku: json['sku'] as String,
    special_end_date: json['special_end_date'] as String,
    special_price: json['special_price'] as int,
    special_start_date: json['special_start_date'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'datetime': instance.datetime,
      'name': instance.name,
      'slug': instance.slug,
      'sku': instance.sku,
      'price': instance.price,
      'quantity': instance.quantity,
      'image': instance.image,
      'special_price': instance.special_price,
      'special_start_date': instance.special_start_date,
      'special_end_date': instance.special_end_date,
    };
