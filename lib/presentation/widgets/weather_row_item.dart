import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_clean_architeture/presentation/themes/app_colors.dart';
import 'package:weather_app_clean_architeture/presentation/themes/app_fonts.dart';

class WeatherRowItem extends StatefulWidget {
  const WeatherRowItem({super.key});

  @override
  State<WeatherRowItem> createState() => _WeatherRowItemState();
}

class _WeatherRowItemState extends State<WeatherRowItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320.w,
          height: 2,
          color: Colors.grey,
        ),
        Container(
          width: 345.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Monday",
                style: AppFonts.s20w400.copyWith(color: Colors.white),
              ),
              SizedBox(
                width: 70.w,
              ),
              Image.asset("assets/img/cloud1.png"),
              SizedBox(
                width: 60.w,
              ),
              Text(
                "10",
                style: AppFonts.s24w400.copyWith(color: Colors.white),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "10",
                style: AppFonts.s24w400.copyWith(color: AppColors.tempColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}