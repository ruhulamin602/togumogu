// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/shopping_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/spalsh_screen.dart';
import '../screens/welcome_screen.dart';
import '../widgets/home_screen.dart';

class Routes {
  static const String myHomePage = '/my-home-page';
  static const String welcomeScreen = '/welcome-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String loginPage = '/login-page';
  static const String shoppingScreen = '/shopping-screen';
  static const String splashScreen = '/';
  static const all = <String>{
    myHomePage,
    welcomeScreen,
    signUpScreen,
    loginPage,
    shoppingScreen,
    splashScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(
      Routes.myHomePage,
      page: MyHomePage,
      generator: MyHomePageRouter(),
    ),
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.shoppingScreen, page: ShoppingScreen),
    RouteDef(Routes.splashScreen, page: SplashScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    MyHomePage: (data) {
      final args = data.getArgs<MyHomePageArguments>(
        orElse: () => MyHomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyHomePage(title: args.title),
        settings: data,
      );
    },
    WelcomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeScreen(),
        settings: data,
      );
    },
    SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    ShoppingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShoppingScreen(),
        settings: data,
      );
    },
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
  };
}

class MyHomePageRoutes {
  static const String homeScreen = '/home-screen';
  static const String shoppingScreen = '/shopping-screen';
  static const all = <String>{
    homeScreen,
    shoppingScreen,
  };
}

class MyHomePageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(MyHomePageRoutes.homeScreen, page: HomeScreen),
    RouteDef(MyHomePageRoutes.shoppingScreen, page: ShoppingScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeScreen(),
        settings: data,
      );
    },
    ShoppingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShoppingScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MyHomePage arguments holder class
class MyHomePageArguments {
  final String title;
  MyHomePageArguments({this.title});
}
