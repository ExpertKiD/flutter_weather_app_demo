import 'package:intl/intl.dart';

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

    print('Current Day:' + currentDateTime.day.toString());
    print('Target Day:' + targetDateTime.day.toString());

    if (targetDateTime.day - currentDateTime.day == 1) {
      return 'Tomorrow';
    } else {
      return DateFormat('EEEE').format(targetDateTime).toString();
    }
  }
}
