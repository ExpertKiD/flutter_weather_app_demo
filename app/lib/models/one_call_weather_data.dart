import 'dart:convert';

import 'package:app/models/weather.dart';

class OneCallWeatherData {
  final double latitude;
  final double longitude;
  final String timezone;
  final int timezoneOffset;
  final List<Weather> dailyForecasts;

  OneCallWeatherData({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezoneOffset,
    required this.dailyForecasts,
  });

  factory OneCallWeatherData.fromJSON(Map<String, dynamic> json) {
    List<Weather> dailyForecastList =
        (json["daily"] as List<dynamic>).map((weatherJson) {
      return Weather(
        dt: weatherJson["dt"] as int,
        tempMin: weatherJson["temp"]["min"] as double,
        tempMax: weatherJson["temp"]["max"] as double,
        weatherCondition: weatherJson["weather"][0]["main"],
        humidity: weatherJson["humidity"] as int,
        pressure: weatherJson["pressure"] as int,
        windSpeed: weatherJson["wind_speed"] as double,
        windDirection: weatherJson["wind_deg"] as int,
      );
    }).toList();

    // removing today's forecast
    dailyForecastList.removeAt(0);

    return OneCallWeatherData(
      latitude: json["lat"] as double,
      longitude: json["lon"] as double,
      timezone: json["timezone"].toString(),
      timezoneOffset: json["timezone_offset"] as int,
      dailyForecasts: dailyForecastList,
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "lat": latitude,
      "lon": longitude,
      "timezone": timezone,
      "timezone_offset": timezoneOffset
    };
  }

  String toJSONString() {
    return jsonEncode(toJSON());
  }

  factory OneCallWeatherData.fromJSONString(String jsonStr) {
    return OneCallWeatherData.fromJSON(jsonDecode(jsonStr));
  }
}
