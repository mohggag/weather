class TodayWeatherModel {
  String cityName;
  String countryName;
  String updatedTime;
  String weatherIcon;
  double temp;
  String weatherState;
  double windSpeed;
  String dayTwodate;
  String dayTwoweatherIcon;
  double dayTwotemp;
  String dayThreedate;
  String dayThreeweatherIcon;
  double dayThreetemp;

  TodayWeatherModel(
      {required this.cityName,
      required this.countryName,
      required this.updatedTime,
      required this.weatherIcon,
      required this.temp,
      required this.weatherState,
      required this.windSpeed,
      required this.dayTwodate,
      required this.dayTwoweatherIcon,
      required this.dayTwotemp,
      required this.dayThreeweatherIcon,
      required this.dayThreetemp,
      required this.dayThreedate});

  factory TodayWeatherModel.fromJson(dynamic data) {
    var dayTwoJsondata = data['forecast']['forecastday'][1];
    var dayThreeJsondata = data['forecast']['forecastday'][2];

    return TodayWeatherModel(
        cityName: data['location']['name'],
        countryName: data['location']['country'],
        updatedTime: data['location']['localtime'],
        weatherIcon: data['current']['condition']['icon'],
        temp: data['current']['temp_c'],
        weatherState: data['current']['condition']['text'],
        windSpeed: data['current']['wind_kph'],
        dayTwodate: dayTwoJsondata['date'],
        dayTwoweatherIcon: dayTwoJsondata['day']['condition']['icon'],
        dayTwotemp: dayTwoJsondata['day']['avgtemp_c'],
        dayThreedate: dayThreeJsondata['date'],
        dayThreeweatherIcon: dayThreeJsondata['day']['condition']['icon'],
        dayThreetemp: dayThreeJsondata['day']['avgtemp_c']);
  }

  @override
  String toString() {
    return 'city = $cityName  , country = $countryName , temp = $temp';
  }
}
