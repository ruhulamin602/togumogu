import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:togumogu/src/services/dio_client.dart';

class AuthenticationRepository with ChangeNotifier {
  DioClient dioClient;

  String _baseUrl = env["BETA_API"];

  String _token;
  String _userId;
  String _msj;

  bool get isAuth {
    // print("Auth " + _token);
    return _token != null;
  }

  String get getToken {
    return _token;
  }

  String get getUserId {
    return _userId;
  }

  String get getMsj {
    return _msj;
  }

  AuthenticationRepository() {
    var dio = Dio();

    dioClient = DioClient(_baseUrl, dio);
  }

  Future<bool> logIn({
    @required String username,
    @required String password,
    @required String devicename,
  }) async {
    assert(username != null);
    assert(password != null);
    assert(devicename != null);

    try {
      final resp = await dioClient.post(
        "/v1/auth/login",
        data: {
          "username": username,
          "password": password,
          "device_name": devicename
        },
      );

      _token = resp["token"];
      _userId = resp["user"]["id"].toString();
      print(resp["token"]);
      print(_token);
      print(_userId);

      // print(res);
      print(_token + "   dkjfkdjlkfdfkdjf sdl");
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", _token);
      return true;
    } catch (e) {
      print(e.toString());
      // _msj = e["message"].toString()?? "There somothin going wrong";
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup({
    String name,
    @required String username,
    @required String password,
    @required String devicename,
    @required String confirm_password,
  }) async {
    assert(username != null);
    assert(password != null);
    assert(devicename != null);
    assert(confirm_password != null);

    try {
      final resp = await dioClient.post(
        "/v1/auth/register",
        data: {
          "name": name ?? username,
          "username": username,
          "password": password,
          "password_confirmation": confirm_password,
          "device_name": devicename
        },
      );
      _token = resp["token"];
      _userId = resp["user"]["id"].toString();
      print(resp["token"]);
      print(_token);
      print(_userId);

      // print(res);
      // print(_token + "   dkjfkdjlkfdfkdjf sdl");
      notifyListeners();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("token", _token);
      return true;
    } on DioError catch (e) {
      _msj = e.response.data['errors']['username'][0];
      notifyListeners();
      print(e.response.data['errors']['username'][0] + "Response error");
      return false;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token')) {
      return false;
    }

    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;

    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('userData');
    prefs.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
