import 'package:flutter/material.dart';
import 'package:weather_app_clean_architeture/presentation/themes/app_colors.dart';
import 'package:weather_app_clean_architeture/presentation/themes/app_fonts.dart';
import 'package:weather_app_clean_architeture/presentation/widgets/switch_theme_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_clean_architeture/presentation/widgets/weather_row.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool themeState = true;

  void changeTheme() {
    setState(() {
      themeState = !themeState;
    });
  }

  var weatherState = null;

  void getWeather(String city) async {
    var dio = Dio();
    try {
      var response = await dio.get(
          "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=82424742061e498492facc25c51dd408&units=metric");
      setState(() {
        weatherState = response.data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather("bishkek");
    print(dateWeatherDay('Rain'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: themeState == true
              ? AppColors.bgColorLight
              : AppColors.bgColorDark,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SwitchThemeBtn(
                          changeTheme: changeTheme, themeState: themeState),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        weatherState != null
                            ? weatherState["city"]["name"]
                            : "Loading...",
                        style: AppFonts.s36w400.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    weatherState != null
                        ? weatherState["list"][0]['weather'][0]['main']
                        : "Loading...",
                    style: AppFonts.s24w400.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  /* Container(
                    child: 
                  ) */
                  Image.asset(
                    themeState == true
                        ? dateWeatherDay(weatherState != null &&
                                weatherState['list'] != null &&
                                weatherState['list'].isNotEmpty &&
                                weatherState['list'][0]['weather'] != null &&
                                weatherState['list'][0]['weather'].isNotEmpty
                            ? weatherState['list'][0]['weather'][0]['main']
                            : null)
                        : "assets/img/moon1.png",
                    // width: 100,
                    // height: 100,
                    // scale: 0.9,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    weatherState != null
                        ? "${weatherState["list"][0]['main']['temp']}°C"
                        : "Loading...",
                    style: AppFonts.s50w700.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    weatherState == null
                        ? "Loading..."
                        : weatherState['list'][0]['dt_txt'].split(" ")[0],
                    style: AppFonts.s22w400.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  WeatherRow(),
                ],
              ),
            ),
          ),
        ));
  }
}

String dateWeatherDay(String? weatherState) {
  if (weatherState != null) {
    if (weatherState == "Clouds") {
      return "assets/img/cloud1.png";
    } else if (weatherState == "Rain") {
      return "assets/img/rain1.png";
    }
  }
  return "assets/img/sun1.png";
}

String dateWeatherEvening(String? weatherState) {
  if (weatherState == null) {
    return "";
  }
  return weatherState;
}
