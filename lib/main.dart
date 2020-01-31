import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator',
      theme: ThemeData(
        canvasColor: BmiColors.blue1,
        cardColor: BmiColors.blue2,
        accentColor: BmiColors.blue3,
        primaryColor: BmiColors.pink,
        highlightColor: BmiColors.white,
        textTheme: const TextTheme(
          title: TextStyle(
            fontSize: 16,
            color: BmiColors.white,
            letterSpacing: 0.5,
          ),
          button: TextStyle(
            fontSize: 16,
            color: BmiColors.white,
            letterSpacing: 2,
          ),
          body1: TextStyle(
            fontSize: 16,
            color: BmiColors.grey,
            letterSpacing: 0.5,
          ),
          body2: TextStyle(
            fontSize: 16,
            color: BmiColors.white,
            letterSpacing: 0.5,
          ),
          display1: TextStyle(
            fontSize: 50,
            color: BmiColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: InputPage(),
    );
  }
}
