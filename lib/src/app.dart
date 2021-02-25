import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:togumogu/src/bloc/appbar/language_toggle.dart';
import 'package:togumogu/src/bloc/appbar/tabbar_index_change.dart';
import 'package:togumogu/src/bloc/article/category_cubit.dart';
import 'package:togumogu/src/bloc/article/product_cubit.dart';
import 'package:togumogu/src/bloc/form/my_form_bloc.dart';
import 'package:togumogu/src/repository/api_repository.dart';
import 'package:togumogu/src/repository/beta_api_repository.dart';

import 'package:togumogu/src/routes/router.gr.dart' as Router;
import 'package:togumogu/src/screens/login_screen.dart';
import 'package:togumogu/src/screens/shopping_screen.dart';
import 'package:togumogu/src/screens/home/home.dart';
import 'package:togumogu/src/screens/signup_screen.dart';

import 'package:togumogu/src/screens/spalsh_screen.dart';
import 'package:togumogu/src/widgets/home_screen.dart';

import 'bloc/article/article_cubit.dart';
import 'bloc/article/featured_article.dart';
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
          BlocProvider<CategoyCubit>(
            create: (BuildContext context) {
              return CategoyCubit(apiRepository: BetaAPIRepository());
            },
            child: ShoppingScreen(),
          ),
          BlocProvider<ProductCubit>(
            create: (BuildContext context) {
              return ProductCubit(apiRepository: BetaAPIRepository());
            },
            child: ShoppingScreen(),
          ),
          BlocProvider<LanguageBloc>(
            create: (BuildContext context) {
              return LanguageBloc();
            },
            child: MyAppBar(),
          ),
          BlocProvider<TabbarBloc>(
            create: (BuildContext context) {
              return TabbarBloc();
            },
            child: MyAppBar(),
          ),
          BlocProvider<MyFormBloc>(
            create: (BuildContext context) {
              return MyFormBloc();
            },
            child: LoginScreen(),
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
                textTheme: GoogleFonts.ubuntuTextTheme(
                  Theme.of(context).textTheme,
                ),

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
