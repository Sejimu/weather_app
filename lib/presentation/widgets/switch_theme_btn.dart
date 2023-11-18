import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_clean_architeture/presentation/themes/app_colors.dart';


class SwitchThemeBtn extends StatefulWidget {

  final void Function() changeTheme;
  bool themeState;

   SwitchThemeBtn({super.key , required this.themeState , required this.changeTheme});


  @override
  State<SwitchThemeBtn> createState() => _SwitchThemeBtnState();
}

class _SwitchThemeBtnState extends State<SwitchThemeBtn> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.btnBgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(onPressed: widget.changeTheme, icon: Icon(widget.themeState ? Icons.brightness_3 : Icons.brightness_4)),
    );
  }
}
