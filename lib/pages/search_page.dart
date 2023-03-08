import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key, this.updateUi});

  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search a City',
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherService service = WeatherService();
                service.getWeather(cityName: cityName!);
                TodayWeatherModel? weather =
                    await service.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 32.h, horizontal: 15.w),
                  label: const Text('Search'),
                  border: const OutlineInputBorder(),
                  hintText: 'Enter City Name',
                  suffixIcon: IconButton(
                      onPressed: () async {
                        WeatherService service = WeatherService();
                        service.getWeather(cityName: cityName!);
                        TodayWeatherModel? weather =
                            await service.getWeather(cityName: cityName!);
                        Provider.of<WeatherProvider>(context, listen: false)
                            .weatherData = weather;
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.search,
                      ))),
            ),
          ),
        ));
  }
}
