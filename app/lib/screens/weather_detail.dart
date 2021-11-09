import 'package:flutter/material.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:
          Text('This page shows the weather for the selected day in detail.'),
    );
  }
}
