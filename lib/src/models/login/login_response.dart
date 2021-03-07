
import 'package:json_annotation/json_annotation.dart';
import 'package:togumogu/src/models/login/user.dart';
part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  final String token;
  final User user;
  LoginResponse({this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
// eliyas@batterylowinteractive.com