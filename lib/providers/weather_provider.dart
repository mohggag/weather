import 'package:flutter/material.dart';
import 'package:weather_app/models/today_weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  TodayWeatherModel? _weatherData;

  set weatherData(TodayWeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  TodayWeatherModel? get weatherData => _weatherData;
}
