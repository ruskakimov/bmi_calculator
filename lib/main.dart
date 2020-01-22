import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_page.dart';
import 'colors.dart';
import 'widgets.dart' as widgets;

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
      theme: ThemeData(
        canvasColor: BmiColors.blue1,
        cardColor: BmiColors.blue2,
        accentColor: BmiColors.blue3,
        primaryColor: BmiColors.pink,
        highlightColor: BmiColors.white,
        textTheme: TextTheme(
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
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          body2: TextStyle(
            fontSize: 16,
            color: BmiColors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
          display1: TextStyle(
            fontSize: 50,
            color: BmiColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('images/selector_page.png'),
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Opacity(
            opacity: 0.5,
            child: Scaffold(
              appBar: widgets.AppBar('BMI CALCULATOR'),
              body: InputPage(),
            ),
          ),
        ],
      ),
    );
  }
}
