import 'package:flutter/material.dart';
import 'package:weather_app_clean_architeture/presentation/themes/app_colors.dart';
import 'package:weather_app_clean_architeture/presentation/widgets/switch_theme_btn.dart';

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SwitchThemeBtn(changeTheme: changeTheme , themeState: themeState ),
                Text("hello")
              ],
            ),
          ),
        )
    );
  }
}

