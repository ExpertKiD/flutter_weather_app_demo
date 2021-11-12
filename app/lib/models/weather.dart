import 'package:intl/intl.dart';

enum WeatherCondition {
  clear,
  clouds,
  fog,
  lightRain,
  rain,
  snow,
  storm,
}

class Weather {
  final int dt;
  final double tempMin;
  final double tempMax;
  final String weatherCondition;
  final int weatherConditionId;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final int windDirection;

  Weather({
    required this.dt,
    required this.tempMin,
    required this.tempMax,
    required this.weatherCondition,
    required this.weatherConditionId,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
  });

  String getDay() {
    DateTime targetDateTime = DateTime.fromMillisecondsSinceEpoch(dt * 1000);
    DateTime currentDateTime = DateTime.now();

    if (targetDateTime.day - currentDateTime.day == 1) {
      return 'Tomorrow';
    } else {
      return DateFormat('EEEE').format(targetDateTime).toString();
    }
  }

  WeatherCondition getWeatherCondition() {
    WeatherCondition currentCondition = WeatherCondition.clear;

    if (weatherConditionId >= 200 && weatherConditionId <= 232) {
      currentCondition = WeatherCondition.storm;
    } else if ((weatherConditionId >= 300 && weatherConditionId <= 321) ||
        weatherConditionId == 500) {
      currentCondition = WeatherCondition.lightRain;
    } else if (weatherConditionId >= 500 && weatherConditionId <= 531) {
      currentCondition = WeatherCondition.rain;
    } else if (weatherConditionId >= 600 && weatherConditionId <= 622) {
      currentCondition = WeatherCondition.snow;
    } else if (weatherConditionId >= 701 && weatherConditionId <= 781) {
      currentCondition = WeatherCondition.fog;
    } else if (weatherConditionId == 800) {
      currentCondition = WeatherCondition.clear;
    } else if (weatherConditionId >= 801 && weatherConditionId <= 804) {
      currentCondition = WeatherCondition.clouds;
    }

    return currentCondition;
  }
}
