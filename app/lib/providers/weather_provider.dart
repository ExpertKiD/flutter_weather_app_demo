import 'package:app/models/one_call_weather_data.dart';
import 'package:app/services/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var oneCallWeatherProvider =
    FutureProvider.autoDispose<OneCallWeatherData>((ref) async {
  return await WeatherService.getOneCallWeatherData();
});
