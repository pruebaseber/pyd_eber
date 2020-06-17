import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

List listaTemas = <AppTheme>[
  AppTheme.light(),
  AppTheme.dark(),
//  customAppTheme(),
//  customAppRosaTheme(),
//  customAppBrownTheme(),
//  customAppWhiteTheme()
  //RojoIntenso()

];

AppTheme customAppTheme() {
  return AppTheme(
    id: "custom_theme",
    description: "Custom Color Scheme",
    data: ThemeData(
      accentColor: Color(0XFFFFE7DB),
      primaryColor: Color(0XFF000280),              // 1
      scaffoldBackgroundColor: Color(0XFF4D4FFF),
      buttonColor: Color(0XFF0005CC),
      dialogBackgroundColor: Color(0XFF805947),

    ),
  );
}

AppTheme customAppRosaTheme() {
  return AppTheme(
    id: "custom_rosa-theme",
    description: "Colores Rosa",
    data: ThemeData(
      accentColor: Colors.white10,
      primaryColor: Color(0XFFFF42FA),
      scaffoldBackgroundColor: Color(0XFFFF5DFF),
      buttonColor: Color(0XFF9DFA6B),
      dialogBackgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color(0XFFFFFD4D)),
      cardColor: Color(0XFFFF42FA),
    ),

  );
}


AppTheme customAppBrownTheme() {
  return AppTheme(
    id: "custom_brown-theme",
    description: "0X",
    data: ThemeData(
      accentColor: Color(0XFF874700),
      primaryColor: Color(0XFF874700),
      scaffoldBackgroundColor: Color(0XFF00FF88),
      buttonColor: Color(0XFF00FF88),
      dialogBackgroundColor: Color(0XFF00FF88),
    ),
  );
}


AppTheme customAppWhiteTheme() {
  return AppTheme(
    id: "custom_white-theme",
    description: "Custom Violet Color Scheme",
    data: ThemeData(
      accentColor: Colors.red,
      primaryColor: Colors.yellow,
      scaffoldBackgroundColor: Colors.orangeAccent,
      buttonColor: Colors.black26,
      dialogBackgroundColor: Colors.red,
    ),
  );
}

AppTheme rojoIntenso() {
  return AppTheme(
    id: "rojo_intenso",
    description: "Rojo Intenso",
    data: ThemeData(
        primaryColor: Color(0XFF3F2340),
        scaffoldBackgroundColor: Color(0XFFBF7A24),
        cardColor: Color(0XFF8C501C),
        buttonColor: Color(0XFFA68376),
        iconTheme: IconThemeData(color: Color(0XFFA68376)),
        accentColor: Color(0XFFA68376),
        dialogBackgroundColor: Color(0XFFD93B48),
    ),
  );
}