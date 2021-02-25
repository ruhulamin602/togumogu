/*
* Run this command in terminal
* flutter packages pub run build_runner build
* */

/*
* Run this command in terminal to watch auto change
* flutter packages pub run build_runner watch
* */
import 'package:auto_route/auto_route_annotations.dart';
import 'package:togumogu/src/screens/home_screen_navigator.dart';
import 'package:togumogu/src/screens/shopping_screen.dart';
import 'package:togumogu/src/screens/home/home.dart';
import 'package:togumogu/src/screens/login_screen.dart';
import 'package:togumogu/src/screens/signup_screen.dart';
import 'package:togumogu/src/screens/spalsh_screen.dart';
import 'package:togumogu/src/screens/welcome_screen.dart';
import 'package:togumogu/src/widgets/home_screen.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(
    page: MyHomePage,
    children: <AutoRoute>[
      AutoRoute(page: HomeScreen,path: '/'),
      AutoRoute(page: ShoppingScreen,path: '/shopping'),

    ]
  ),
  AutoRoute(page: WelcomeScreen),
  AutoRoute(page: SignUpScreen),
  AutoRoute(page: LoginScreen),
  AutoRoute(page: ShoppingScreen),
  AutoRoute(page: MainHomeScreen, children:  <AutoRoute>[
        // path: '/' is the same as setting initial to true
        AutoRoute(path: '/', page: HomeScreen),
        AutoRoute(path: '/shopping', page: ShoppingScreen),
      ],),
  AutoRoute(page: SplashScreen, initial: true),
])
class $Router {}
