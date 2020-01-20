import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          title: TextStyle(fontSize: 16, color: BmiColors.white),
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
            opacity: 1,
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

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _male = true;
  int _weight = 74;
  int _age = 19;

  void _handleWeightChange(int change) {
    setState(() {
      _weight = min(max(0, _weight + change), 200);
    });
  }

  void _handleAgeChange(int change) {
    setState(() {
      _age = min(max(0, _age + change), 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 30),
                Expanded(
                  flex: 6,
                  child: widgets.GenderSwitcher(
                    male: _male,
                    onSwitch: (male) {
                      setState(() {
                        _male = male;
                      });
                    },
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  flex: 8,
                  child: widgets.Card(),
                ),
                SizedBox(height: 24),
                Expanded(
                  flex: 8,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: widgets.StepperCard(
                          title: 'WEIGHT',
                          value: _weight,
                          onChange: _handleWeightChange,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: widgets.StepperCard(
                          title: 'AGE',
                          value: _age,
                          onChange: _handleAgeChange,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
        widgets.PrimaryButton('CALCULATE YOUR BMI'),
      ],
    );
  }
}
