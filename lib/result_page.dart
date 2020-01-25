import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets.dart' as widgets;
import 'colors.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    @required this.isMale,
    @required this.height,
    @required this.weight,
    @required this.age,
  });

  final bool isMale;
  final int height;
  final int weight;
  final int age;

  @override
  Widget build(BuildContext context) {
    final bmi = weight / pow(height / 100, 2);

    var result = 'normal';

    if (bmi >= 30)
      result = 'obese';
    else if (bmi >= 25)
      result = 'overweight';
    else if (bmi < 18.5) result = 'underweight';

    return Scaffold(
      appBar: widgets.CustomAppBar('YOUR RESULT'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: widgets.Card(
          color: BmiColors.blue2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BMI INDEX',
                style: Theme.of(context).textTheme.body1,
                textAlign: TextAlign.center,
              ),
              Text(
                bmi.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 90,
                  color: BmiColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                result.toUpperCase(),
                style: Theme.of(context).textTheme.body2.copyWith(
                      color:
                          result == 'normal' ? BmiColors.green : BmiColors.pink,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
