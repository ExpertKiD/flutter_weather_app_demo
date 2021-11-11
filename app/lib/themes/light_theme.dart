import 'package:app/resources/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.sunshineBlue,
  primaryColorLight: AppColors.sunshineLightBlue,
  primaryColorDark: AppColors.sunshineDarkBlue,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.sunshineBlue,
  ),
);
