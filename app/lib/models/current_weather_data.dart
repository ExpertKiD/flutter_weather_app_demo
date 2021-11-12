import 'dart:convert';

import 'package:app/models/weather.dart';

class CurrentWeatherData {
  final double latitude;
  final double longitude;
  final int timezoneOffset;
  final String location;

  final Weather currentWeather;

  CurrentWeatherData({
    required this.latitude,
    required this.longitude,
    required this.timezoneOffset,
    required this.location,
    required this.currentWeather,
  });

  factory CurrentWeatherData.fromJSON(Map<String, dynamic> json) {
    return CurrentWeatherData(
      latitude: json["coord"]["lat"] as double,
      longitude: json["coord"]["lon"] as double,
      timezoneOffset: json["timezone"] as int,
      location: json["name"],
      currentWeather: Weather(
        dt: json["dt"] as int,
        humidity: json["main"]["humidity"] as int,
        pressure: json["main"]["pressure"] as int,
        tempMax: json["main"]["temp_max"] as double,
        tempMin: json["main"]["temp_min"] as double,
        weatherCondition: json["weather"][0]["main"],
        weatherConditionId: json["weather"][0]["id"] as int,
        windDirection: json["wind"]["deg"] as int,
        windSpeed: double.parse(json["wind"]["speed"].toString()),
      ),
    );
  }

  factory CurrentWeatherData.fromJSONString(String jsonStr) {
    return CurrentWeatherData.fromJSON(jsonDecode(jsonStr));
  }
}
