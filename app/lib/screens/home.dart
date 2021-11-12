import 'package:app/models/current_weather_data.dart';
import 'package:app/models/one_call_weather_data.dart';
import 'package:app/models/weather_data.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/resources/colors.dart';
import 'package:app/screens/settings.dart';
import 'package:app/view_models/weather.dart';
import 'package:app/widgets/weather_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(weatherProvider).when(
        data: (weatherDataList) {
          final weatherData = WeatherData(
            currentWeatherData: weatherDataList[0] as CurrentWeatherData,
            oneCallWeatherData: weatherDataList[1] as OneCallWeatherData,
          );

          WeatherModel currentWeatherModel = WeatherModel.fromWeather(
            weatherData.currentWeatherData.currentWeather,
          );

          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 290,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()),
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 290 - 56,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 32, bottom: 16, left: 60),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentWeatherModel
                                          .getTodayStringWithDateAndMonth(),
                                      style: GoogleFonts.robotoCondensed(
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            '${currentWeatherModel.tempMax.round()}\u00b0',
                                            style: GoogleFonts.robotoCondensed(
                                              fontSize: 72,
                                              fontWeight: FontWeight.w100,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          Text(
                                            '${currentWeatherModel.tempMin.round()}\u00b0',
                                            style: GoogleFonts.robotoCondensed(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w100,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      weatherData.oneCallWeatherData.timezone,
                                      style: GoogleFonts.robotoCondensed(
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                margin: EdgeInsets.only(right: 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      currentWeatherModel
                                          .getWeatherConditionImagePath(),
                                      cacheWidth: 122,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 16),
                                      child: Text(
                                        currentWeatherModel.weatherCondition,
                                        style: GoogleFonts.robotoCondensed(
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                title: Image.asset(
                  'assets/images/ic_logo.png',
                  cacheHeight: 48,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return WeatherTile(
                      weather:
                          weatherData.oneCallWeatherData.dailyForecasts[index]);
                },
                    childCount:
                        weatherData.oneCallWeatherData.dailyForecasts.length),
              )
            ],
          );
        },
        error: (error, stackTrace) {
          if (!kReleaseMode) {
            print(error);
            print(stackTrace);
          }

          return const Center(
              child: Text('Error loading data. Please try again later'));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
