import 'package:app/models/current_weather_data.dart';
import 'package:app/models/one_call_weather_data.dart';
import 'package:app/services/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var oneCallWeatherProvider = FutureProvider<OneCallWeatherData>((ref) async {
  return await WeatherService.getOneCallWeatherData();
});

var currentWeatherProvider = FutureProvider<CurrentWeatherData>((ref) async {
  return await WeatherService.getCurrentWeatherData();
});

final weatherProvider = FutureProvider((ref) async {
  return await Future.wait([
    WeatherService.getCurrentWeatherData(),
    WeatherService.getOneCallWeatherData()
  ]);
});
