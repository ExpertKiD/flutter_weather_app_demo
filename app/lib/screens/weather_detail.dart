import 'package:app/models/weather.dart';
import 'package:flutter/material.dart';

class WeatherDetailScreen extends StatelessWidget {
  final Weather weather;

  const WeatherDetailScreen({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: Column(
        children: const [
          Text('This page shows the weather for the selected day in detail.'),
          Text('This page shows the weather for the selected day in detail.'),
        ],
      ),
    );
  }
}
