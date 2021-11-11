import 'dart:convert';

class OneCallWeatherData {
  final double latitude;
  final double longitude;
  final String timezone;
  final int timezoneOffset;

  OneCallWeatherData({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezoneOffset,
  });

  factory OneCallWeatherData.fromJSON(Map<String, dynamic> json) {
    return OneCallWeatherData(
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

  factory OneCallWeatherData.fromJSONString(String jsonStr) {
    return OneCallWeatherData.fromJSON(jsonDecode(jsonStr));
  }
}
