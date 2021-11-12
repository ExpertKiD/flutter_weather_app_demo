import 'package:app/models/weather.dart';
import 'package:app/resources/colors.dart';
import 'package:app/screens/weather_detail.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;

  const WeatherTile({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(weather.getWeatherCondition());

    return Material(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WeatherDetailScreen(
              weather: weather,
            ),
          ),
        );
      },
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 60,
          maxHeight: 60,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.8, color: AppColors.grey),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: getWeatherConditionIconImage(),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather.getDay(),
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    weather.weatherCondition,
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weather.tempMax.toStringAsFlexibleFraction(fractionalDigits: 1)}\u00B0',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '${weather.tempMin.toStringAsFlexibleFraction(fractionalDigits: 1)}\u00B0',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Image getWeatherConditionIconImage() {
    WeatherCondition weatherCondition = weather.getWeatherCondition();

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

    return Image.asset(
      imagePath,
      cacheWidth: 32,
    );
  }
}
