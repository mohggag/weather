import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/today_weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'a0363fbad07b4019a43215712230401';
  Future<TodayWeatherModel?> getWeather({required String cityName}) async {
    TodayWeatherModel? weatherData;
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=4');
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weatherData = TodayWeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weatherData;
  }
}
