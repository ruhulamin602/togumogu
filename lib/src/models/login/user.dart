
import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avater,
    this.created_at,
  });
  final String id;
  final String name;
  final String email;
  final String phone;
  final String avater;
  final String created_at;
   factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
