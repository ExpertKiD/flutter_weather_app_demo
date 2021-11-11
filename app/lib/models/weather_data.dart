import 'package:app/models/current_weather_data.dart';

import 'one_call_weather_data.dart';

class WeatherData {
  final OneCallWeatherData oneCallWeatherData;
  final CurrentWeatherData currentWeatherData;

  WeatherData({
    required this.oneCallWeatherData,
    required this.currentWeatherData,
  });
}
