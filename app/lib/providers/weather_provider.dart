import 'package:app/models/weather_data.dart';
import 'package:app/services/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var weatherProvider = FutureProvider.autoDispose<WeatherData>((ref) async {
  return await WeatherService.getWeatherData();
});
