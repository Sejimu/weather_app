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

  void changeTheme(){
    setState(() {
      themeState = !themeState;
    });
  }

  late var weatherState;

  void getWeather(String city)async{
    var dio = Dio();
    try{
      var response = await dio.get("http://api.weatherapi.com/v1/current.json?key=a50262012ed646c9bb9190427231811&q=$city");
      setState(() {
        weatherState = response.data;
      });
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeather("Bishkek");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: themeState == true ? AppColors.bgColorLight : AppColors.bgColorDark,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        )
      ),
        child:  Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 55,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SwitchThemeBtn(changeTheme: changeTheme , themeState: themeState ),
                      SizedBox(width: 20.w,),
                      Text(weatherState["location"]["name"] , style: AppFonts.s36w400.copyWith(color: Colors.white) ,),
                      SizedBox(
                        height: 20.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Clear", style: AppFonts.s24w400.copyWith(color: Colors.white),),
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(themeState == true ? "assets/img/sun1.png" : "assets/img/moon1.png", width: 100, height: 100,),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("11", style: AppFonts.s72w700.copyWith(color: Colors.white),),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("May XX, 20XX", style: AppFonts.s22w400.copyWith(color: Colors.white),),
                  SizedBox(
                    height: 20.h,
                  ),
                  WeatherRow(),
                ],
              ),
            ),
          ),
        )
    );
  }
}

