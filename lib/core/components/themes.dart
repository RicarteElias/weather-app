import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/theme/AppColors.dart';

class AppThemes {
  ///DARK THEME
  static final ThemeData dark = ThemeData(
      snackBarTheme: SnackBarThemeData(),
      iconTheme: IconThemeData(),
      scaffoldBackgroundColor: AppColors.BACKGROUND_DARK,
      textTheme: _BODY_TEXT_DARK,
      errorColor: AppColors.ERROR_DARK,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.PRIMARY_DARK))));

  static const _BODY_TEXT_DARK =
      TextTheme(bodyText2: TextStyle(color: AppColors.TEXT_PRIMARY_DARK));

  ///LIGHT THEME
  static final ThemeData light = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      textTheme: _BODY_TEXT_LIGHT,
      errorColor: AppColors.ERROR_LIGHT);

  static const _BODY_TEXT_LIGHT =
      TextTheme(bodyText2: TextStyle(color: AppColors.TEXT_PRIMARY_LIGHT));
}
