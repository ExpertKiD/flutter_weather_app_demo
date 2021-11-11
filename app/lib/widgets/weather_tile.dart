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
              child: Image.asset(
                'assets/images/ic_clear.png',
                cacheWidth: 32,
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tomorrow',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Clear',
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
}
