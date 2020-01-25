import 'package:flutter/material.dart';

import 'widgets.dart' as widgets;
import 'colors.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                '22.1',
                style: TextStyle(
                  fontSize: 90,
                  color: BmiColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'NORMAL',
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .copyWith(color: BmiColors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
