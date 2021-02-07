// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../screens/catagory_screen.dart';
import '../screens/home/home.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/spalsh_screen.dart';
import '../screens/welcome_screen.dart';

class Routes {
  static const String myHomePage = '/my-home-page';
  static const String welcomeScreen = '/welcome-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String loginScreen = '/login-screen';
  static const String shoppingScreen = '/shopping-screen';
  static const String splashScreen = '/';
  static const all = <String>{
    myHomePage,
    welcomeScreen,
    signUpScreen,
    loginScreen,
    shoppingScreen,
    splashScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.myHomePage, page: MyHomePage),
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
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
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => MyHomePage(title: args.title),
        settings: data,
      );
    },
    WelcomeScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => WelcomeScreen(),
        settings: data,
      );
    },
    SignUpScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    ShoppingScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ShoppingScreen(),
        settings: data,
      );
    },
    SplashScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SplashScreen(),
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
