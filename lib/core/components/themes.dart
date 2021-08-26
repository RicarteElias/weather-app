import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/theme/AppColors.dart';

class AppThemes {
  ///DARK THEME
  static final ThemeData dark = ThemeData(
      iconTheme: IconThemeData(),
      scaffoldBackgroundColor: AppColors.BACKGROUND_DARK,
      textTheme: TextTheme(),
      errorColor: AppColors.ERROR_DARK,
      primaryTextTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)));

  ///LIGHT THEME
  static final ThemeData light = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(),
      errorColor: AppColors.ERROR_LIGHT,
      primaryTextTheme:
          TextTheme(bodyText2: TextStyle(color: AppColors.TEXT_PRIMARY_LIGHT)));
}
