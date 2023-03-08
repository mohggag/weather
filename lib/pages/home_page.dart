// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  var dt = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                  updateUi: updateUi,
                );
              }));
            },
            icon: const Icon(Icons.search_rounded),
          )
        ],
      ),
      body: weatherData == null
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff955cd1),
                    Color(0xff3fa2fa),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.85],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/weather.jpg',
                        width: 280,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Start searching now 🔍',
                      style: TextStyle(
                          fontSize: 25.0.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchPage(
                            updateUi: updateUi,
                          );
                        }));
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 50.w),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0.sp))),
                      child: Text(
                        'Search',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff955cd1),
                    Color(0xff3fa2fa),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.85],
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        '${weatherData.cityName}, ${weatherData.countryName}',
                        style: TextStyle(
                            fontSize: 20.0.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        ('Updated at : ${DateFormat("hh:mm a").format(DateTime.now())}'),
                        style: TextStyle(
                          fontSize: 15.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        '${weatherData.temp.toInt()}\u00B0',
                        style: TextStyle(
                            fontSize: 55.0.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        weatherData.weatherState,
                        style: TextStyle(
                            fontSize: 20.0.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Image.network(
                        'https:${weatherData.weatherIcon}',
                        width: 70.w,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Wind Speed',
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          const Icon(Icons.wind_power_rounded),
                          Text('${weatherData.windSpeed.toInt()} km/h'),
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              DateFormat.yMMMEd().format(DateTime.parse(
                                  weatherData.dayTwodate.toString())),
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            Text(
                              '${weatherData.dayTwotemp.toInt()}\u00B0',
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w700),
                            ),
                            Image.network(
                              'https:${weatherData.dayTwoweatherIcon}',
                              width: 55.w,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              DateFormat.yMMMEd().format(DateTime.parse(
                                  weatherData.dayThreedate.toString())),
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            Text(
                              '${weatherData.dayThreetemp.toInt()}\u00B0',
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w700),
                            ),
                            Image.network(
                              'https:${weatherData.dayThreeweatherIcon}',
                              width: 55.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
