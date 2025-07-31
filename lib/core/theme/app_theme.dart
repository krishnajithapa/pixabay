import 'package:flutter/material.dart';
import 'package:pixabay/core/constants/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.black,
  primaryColor: AppColors.green,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: AppColors.green,
    secondary: AppColors.lightGreen,
    surface: AppColors.darkGrey,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.green),
    titleTextStyle: TextStyle(
      color: AppColors.green,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.white),
    bodyMedium: TextStyle(color: AppColors.white),
    headlineSmall: TextStyle(
      color: AppColors.green,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(color: AppColors.green),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkGrey,
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.green),
    ),
    labelStyle: TextStyle(color: AppColors.green),
  ),
  iconTheme: const IconThemeData(color: AppColors.green),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.green,
    foregroundColor: AppColors.black,
  ),
);
