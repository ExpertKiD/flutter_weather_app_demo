import 'package:app/screens/home.dart';
import 'package:app/themes/dark_theme.dart';
import 'package:app/themes/light_theme.dart';
import 'package:flutter/material.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
