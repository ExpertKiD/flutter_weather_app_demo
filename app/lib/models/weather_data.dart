import 'dart:convert';

class WeatherData {
  final double latitude;
  final double longitude;
  final String timezone;
  final int timezoneOffset;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezoneOffset,
  });

  factory WeatherData.fromJSON(Map<String, dynamic> json) {
    print('Inside fromJSON');
    print(json["lat"] is double ? 'yes double' : 'not double');

    return WeatherData(
      latitude: json["lat"] as double,
      longitude: json["lon"] as double,
      timezone: json["timezone"].toString(),
      timezoneOffset: json["timezone_offset"] as int,
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

  factory WeatherData.fromJSONString(String jsonStr) {
    print('Inside fromJSONString()');
    print(jsonStr);

    return WeatherData.fromJSON(jsonDecode(jsonStr));
  }
}
