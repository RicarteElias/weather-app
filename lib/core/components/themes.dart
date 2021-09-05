import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/theme/AppColors.dart';

class AppThemes {
  ///DARK THEME
  static final ThemeData dark = ThemeData(
      appBarTheme: AppBarTheme(color: AppColors.BACKGROUND_DARK),
      snackBarTheme: SnackBarThemeData(),
      primaryColor: AppColors.PRIMARY_DARK,
      iconTheme: IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: AppColors.BACKGROUND_DARK,
      textTheme: _BODY_TEXT_DARK,
      errorColor: AppColors.ERROR_DARK,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.PRIMARY_DARK)),
      ));
  static const _BODY_TEXT_DARK = TextTheme(
    bodyText2: TextStyle(color: AppColors.TEXT_PRIMARY_DARK),
    subtitle1: TextStyle(color: Colors.white),
  );

  ///LIGHT THEME
  static final ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(color: AppColors.BACKGROUND_LIGHT),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.PRIMARY_LIGHT,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: _BODY_TEXT_LIGHT,
      errorColor: AppColors.ERROR_LIGHT,
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.PRIMARY_LIGHT))));
  static const _BODY_TEXT_LIGHT = TextTheme(
    bodyText2: TextStyle(color: AppColors.TEXT_PRIMARY_LIGHT),
    subtitle1: TextStyle(color: Colors.white),
  );
}
