import 'package:app/models/current_weather_data.dart';
import 'package:app/models/one_call_weather_data.dart';
import 'package:app/models/weather_data.dart';
import 'package:app/providers/weather_provider.dart';
import 'package:app/screens/settings.dart';
import 'package:app/screens/weather_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 300,
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
                      child: Container(height: 300 - 56, color: Colors.red)),
                ),
                title: Image.asset(
                  'assets/images/ic_logo.png',
                  cacheHeight: 48,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Material(
                    color: index % 2 == 0
                        ? Colors.blue.shade200
                        : Colors.blue.shade600,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherDetailScreen(),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          textScaleFactor: 5,
                        ),
                      ),
                    ),
                  );
                }, childCount: 20),
              )
            ],
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text('Error'));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
