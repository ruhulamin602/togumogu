import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:togumogu/src/repository/api_repository.dart';

import 'package:togumogu/src/routes/router.gr.dart' as Router;
import 'package:togumogu/src/screens/home/home.dart';
import 'package:togumogu/src/screens/signup_screen.dart';

import 'package:togumogu/src/screens/spalsh_screen.dart';
import 'package:togumogu/src/widgets/home_screen.dart';

import 'bloc/movie/article_cubit.dart';
import 'bloc/movie/featured_article.dart';
import 'helpers/custom_route.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ArticleCubit>(
            create: (BuildContext context) {
              return ArticleCubit(apiRepository: APIRepository());
            },
            child: HomeScreen(),
          ),
          BlocProvider<FeaturedArticleCubit>(
            create: (BuildContext context) {
              return FeaturedArticleCubit(apiRepository: APIRepository());
            },
            child: HomeScreen(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          // theme: ThemeData(
          //   // This is the theme of your application.
          //   //
          //   // Try running your application with "flutter run". You'll see the
          //   // application has a blue toolbar. Then, without quitting the app, try
          //   // changing the primarySwatch below to Colors.green and then invoke
          //   // "hot reload" (press "r" in the console where you ran "flutter run",
          //   // or simply save your changes to "hot reload" in a Flutter IDE).
          //   // Notice that the counter didn't reset back to zero; the application
          //   primaryColor: Colors.white,
          //   // is not restarted.
          //   primarySwatch: Colors.blue,
          //   // pageTransitionsTheme: PageTransitionsTheme(
          //   //   builders: {
          //   //     TargetPlatform.android: CustomPageTransitionBuilder(),
          //   //     TargetPlatform.iOS: CustomPageTransitionBuilder(),
          //   //   },
          //   // ),
          // ),
          // builder: ExtendedNavigator.builder<Router>(
          //   router: Router(),
          //   initialRoute: Routes.splashScreen,

          // ),
          debugShowCheckedModeBanner: false,
          // onGenerateRoute: Router.onGenerateRoute,
          // navigatorKey: Router.navigator.key,
          // initialRoute: Router.splashScreen,

          builder: ExtendedNavigator.builder<Router.Router>(
            router: Router.Router(),
            
            builder: (context, extendedNav) => Theme(
              data: ThemeData(
                brightness: Brightness.light,
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                primaryColor: Colors.white,
                // is not restarted.
                
                // pageTransitionsTheme: PageTransitionsTheme(
                //   builders: {
                //     TargetPlatform.android: CustomPageTransitionBuilder(),
                //     TargetPlatform.iOS: CustomPageTransitionBuilder(),
                //   },
                // ),
              ),
              child: extendedNav,
            ),
            
          ),
          home: MyHomePage(),
        ));
  }
}
