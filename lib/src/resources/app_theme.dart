import 'package:flutter/material.dart';
import 'package:togumogu/src/resources/app_colors.dart';
import 'package:togumogu/src/resources/text_styles.dart';

import 'font_family.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      fontFamily: AppFonts.poppins,
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.backGroundColor,
      scaffoldBackgroundColor: AppColors.white,
      cardTheme: CardTheme(elevation: 1, margin: EdgeInsets.only()),
      indicatorColor: AppColors.primaryColor,
      accentColor: AppColors.primaryColor,
      buttonTheme: ButtonThemeData(),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.black,
        // unselectedLabelColor: AppColors.color8897A4,
        labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      appBarTheme: AppBarTheme(
          color: AppColors.white,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          textTheme: TextTheme(
            headline6: AppTextStyles.medium18PrimaryColor,
          )),
//        snackBarTheme:
//            SnackBarThemeData(backgroundColor: AppColors.primaryColor)
    );
  }
}
