import 'package:app/models/weather_data.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static Future<WeatherData> getWeatherData() async {
    var client = http.Client();
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=27.708346&lon=85.307326&appid=ffd8d5916ab588747a5715c92772afe2&exclude=minutely');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      var weatherData = WeatherData.fromJSONString(response.body);

      return weatherData;
    } else {
      throw Exception('Error fetching data');
    }
  }
}
