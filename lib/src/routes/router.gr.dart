// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../screens/home/home.dart';
import '../screens/home_screen_navigator.dart';
import '../screens/login_screen.dart';
import '../screens/shopping_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/spalsh_screen.dart';
import '../screens/welcome_screen.dart';
import '../widgets/home_screen.dart';

class Routes {
  static const String myHomePage = '/my-home-page';
  static const String welcomeScreen = '/welcome-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String loginScreen = '/login-screen';
  static const String shoppingScreen = '/shopping-screen';
  static const String mainHomeScreen = '/main-home-screen';
  static const String splashScreen = '/';
  static const all = <String>{
    myHomePage,
    welcomeScreen,
    signUpScreen,
    loginScreen,
    shoppingScreen,
    mainHomeScreen,
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
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.shoppingScreen, page: ShoppingScreen),
    RouteDef(
      Routes.mainHomeScreen,
      page: MainHomeScreen,
      generator: MainHomeScreenRouter(),
    ),
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
    MainHomeScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => MainHomeScreen(),
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

class MyHomePageRoutes {
  static const String homeScreen = '/';
  static const String shoppingScreen = '/shopping';
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
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomeScreen(),
        settings: data,
      );
    },
    ShoppingScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ShoppingScreen(),
        settings: data,
      );
    },
  };
}

class MainHomeScreenRoutes {
  static const String homeScreen = '/';
  static const String shoppingScreen = '/shopping';
  static const all = <String>{
    homeScreen,
    shoppingScreen,
  };
}

class MainHomeScreenRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(MainHomeScreenRoutes.homeScreen, page: HomeScreen),
    RouteDef(MainHomeScreenRoutes.shoppingScreen, page: ShoppingScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomeScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomeScreen(),
        settings: data,
      );
    },
    ShoppingScreen: (data) {
      return buildAdaptivePageRoute<dynamic>(
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
