import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets.dart' as widgets;
import 'colors.dart';

// Data is from here
// https://www.cdc.gov/healthyweight/assessing/bmi/childrens_bmi/about_childrens_bmi.html
// bmi for 5, 85, 95 percentile
const girls = [
  {
    'age': 2,
    '5th': 14.4,
    '85th': 18,
    '95th': 19.1,
  },
  {
    'age': 3,
    '5th': 14,
    '85th': 17.2,
    '95th': 18.3,
  },
  {
    'age': 4,
    '5th': 13.7,
    '85th': 16.8,
    '95th': 18,
  },
  {
    'age': 5,
    '5th': 13.5,
    '85th': 16.8,
    '95th': 18.2,
  },
  {
    'age': 6,
    '5th': 13.4,
    '85th': 17.1,
    '95th': 18.8,
  },
  {
    'age': 7,
    '5th': 13.4,
    '85th': 17.6,
    '95th': 19.6,
  },
  {
    'age': 8,
    '5th': 13.5,
    '85th': 18.3,
    '95th': 20.6,
  },
  {
    'age': 9,
    '5th': 13.8,
    '85th': 19.1,
    '95th': 21.8,
  },
  {
    'age': 10,
    '5th': 14,
    '85th': 20,
    '95th': 23,
  },
  {
    'age': 11,
    '5th': 14.4,
    '85th': 20.8,
    '95th': 24,
  },
  {
    'age': 12,
    '5th': 14.8,
    '85th': 21.7,
    '95th': 25.2,
  },
  {
    'age': 13,
    '5th': 15.3,
    '85th': 22.5,
    '95th': 26.2,
  },
  {
    'age': 14,
    '5th': 15.8,
    '85th': 23.3,
    '95th': 27.2,
  },
  {
    'age': 15,
    '5th': 16.3,
    '85th': 24,
    '95th': 28.1,
  },
  {
    'age': 16,
    '5th': 16.8,
    '85th': 24.6,
    '95th': 28.9,
  },
  {
    'age': 17,
    '5th': 17.2,
    '85th': 25.2,
    '95th': 29.6,
  },
  {
    'age': 18,
    '5th': 17.5,
    '85th': 25.6,
    '95th': 30.3,
  },
  {
    'age': 19,
    '5th': 17.8,
    '85th': 26.1,
    '95th': 31,
  },
];

const boys = [
  {
    'age': 2,
    '5th': 14.8,
    '85th': 18.2,
    '95th': 19.4,
  },
  {
    'age': 3,
    '5th': 14.4,
    '85th': 17.4,
    '95th': 18.2,
  },
  {
    'age': 4,
    '5th': 14,
    '85th': 17,
    '95th': 17.8,
  },
  {
    'age': 5,
    '5th': 13.8,
    '85th': 16.8,
    '95th': 18,
  },
  {
    'age': 6,
    '5th': 13.8,
    '85th': 17,
    '95th': 18.4,
  },
  {
    'age': 7,
    '5th': 13.8,
    '85th': 17.4,
    '95th': 19.2,
  },
  {
    'age': 8,
    '5th': 13.8,
    '85th': 18,
    '95th': 20,
  },
  {
    'age': 9,
    '5th': 14,
    '85th': 18.6,
    '95th': 21,
  },
  {
    'age': 10,
    '5th': 14.2,
    '85th': 19.4,
    '95th': 22,
  },
  {
    'age': 11,
    '5th': 14.6,
    '85th': 20.2,
    '95th': 23.2,
  },
  {
    'age': 12,
    '5th': 15,
    '85th': 21,
    '95th': 24.2,
  },
  {
    'age': 13,
    '5th': 15.4,
    '85th': 21.8,
    '95th': 25.1,
  },
  {
    'age': 14,
    '5th': 16,
    '85th': 22.6,
    '95th': 26,
  },
  {
    'age': 15,
    '5th': 16.6,
    '85th': 23.4,
    '95th': 26.8,
  },
  {
    'age': 16,
    '5th': 17.2,
    '85th': 24.2,
    '95th': 27.5,
  },
  {
    'age': 17,
    '5th': 17.6,
    '85th': 24.9,
    '95th': 28.2,
  },
  {
    'age': 18,
    '5th': 18.2,
    '85th': 25.6,
    '95th': 28.9,
  },
  {
    'age': 19,
    '5th': 18.6,
    '85th': 26.4,
    '95th': 29.7,
  },
];

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

    if (age <= 19) {
      final data = (isMale ? boys : girls).firstWhere((o) => o['age'] == age);
      if (bmi >= data['95th'])
        result = 'obese';
      else if (bmi >= data['85th'])
        result = 'overweight';
      else if (bmi < data['5th']) result = 'underweight';
    } else {
      if (bmi >= 30)
        result = 'obese';
      else if (bmi >= 25)
        result = 'overweight';
      else if (bmi < 18.5) result = 'underweight';
    }

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
