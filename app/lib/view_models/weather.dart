import 'package:app/models/weather.dart';
import 'package:intl/intl.dart';

class WeatherModel extends Weather {
  WeatherModel.fromWeather(Weather weather)
      : super(
          windSpeed: weather.windSpeed,
          windDirection: weather.windDirection,
          weatherCondition: weather.weatherCondition,
          tempMin: weather.tempMin,
          tempMax: weather.tempMax,
          pressure: weather.pressure,
          humidity: weather.humidity,
          dt: weather.dt,
          weatherConditionId: weather.weatherConditionId,
        );

  String getWeatherConditionImagePath() {
    var imagePath = '';

    switch (getWeatherCondition()) {
      case WeatherCondition.clear:
        imagePath = 'assets/images/art_clear.png';
        break;
      case WeatherCondition.clouds:
        imagePath = 'assets/images/art_clouds.png';
        break;
      case WeatherCondition.fog:
        imagePath = 'assets/images/art_fog.png';
        break;
      case WeatherCondition.lightRain:
        imagePath = 'assets/images/art_light_rain.png';
        break;
      case WeatherCondition.rain:
        imagePath = 'assets/images/art_rain.png';
        break;
      case WeatherCondition.snow:
        imagePath = 'assets/images/art_snow.png';
        break;
      case WeatherCondition.storm:
        imagePath = 'assets/images/art_storm.png';
        break;

      default:
        break;
    }

    return imagePath;
  }

  String getWeatherConditionIconImagePath() {
    WeatherCondition weatherCondition = getWeatherCondition();

    String imagePath = '';

    switch (weatherCondition) {
      case WeatherCondition.clear:
        imagePath = 'assets/images/ic_clear.png';
        break;
      case WeatherCondition.clouds:
        imagePath = 'assets/images/ic_cloudy.png';
        break;
      case WeatherCondition.fog:
        imagePath = 'assets/images/ic_fog.png';
        break;
      case WeatherCondition.lightRain:
        imagePath = 'assets/images/ic_light_rain.png';
        break;
      case WeatherCondition.rain:
        imagePath = 'assets/images/ic_rain.png';
        break;
      case WeatherCondition.snow:
        imagePath = 'assets/images/ic_snow.png';
        break;
      case WeatherCondition.storm:
        imagePath = 'assets/images/ic_storm.png';
        break;

      default:
        break;
    }

    return imagePath;
  }

  String getTodayStringWithDateAndMonth() {
    String dateString = DateFormat('MMMd')
        .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000));

    return 'Today, $dateString';
  }
}
