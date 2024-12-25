import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textLight),
      titleMedium: TextStyle(color: AppColors.textLight),
    ),
    cardColor: AppColors.backgroundLight,
    iconTheme: const IconThemeData(color: AppColors.primaryLight),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textDark),
      titleMedium: TextStyle(color: AppColors.textDark),
    ),
    cardColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
