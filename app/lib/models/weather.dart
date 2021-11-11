class Weather {
  final int dt;
  final double tempMin;
  final double tempMax;
  final String weatherCondition;
  final int humidity;
  final int pressure;
  final double windSpeed;
  final int windDirection;

  Weather({
    required this.dt,
    required this.tempMin,
    required this.tempMax,
    required this.weatherCondition,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
  });
}