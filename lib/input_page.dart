import 'dart:math';

import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'widgets.dart' as widgets;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _male = true;
  int _weight = 50;
  int _age = 20;
  int _height = 150;

  void _handleWeightChange(int change) {
    setState(() {
      _weight = min(max(5, _weight + change), 200);
    });
  }

  void _handleAgeChange(int change) {
    setState(() {
      _age = min(max(2, _age + change), 100);
    });
  }

  void _handleHeightChange(double newHeight) {
    setState(() {
      _height = newHeight.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgets.CustomAppBar('BMI CALCULATOR'),
      body: Column(
        children: <Widget>[
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                    height: max(620, constraints.maxHeight),
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                child: HeightCard(
                                  value: _height,
                                  onChange: _handleHeightChange,
                                  min: 100,
                                  max: 200,
                                ),
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
                                        unit: 'kg',
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
                    ],
                  ),
                ),
              );
            }),
          ),
          widgets.PrimaryButton(
            'CALCULATE YOUR BMI',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    isMale: _male,
                    height: _height,
                    weight: _weight,
                    age: _age,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HeightCard extends StatelessWidget {
  const HeightCard({
    Key key,
    @required this.value,
    @required this.onChange,
    @required this.min,
    @required this.max,
  }) : super(key: key);

  final int value;
  final int min;
  final int max;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return widgets.Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: <Widget>[
            Text('HEIGHT', style: Theme.of(context).textTheme.body1),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(value.toString(),
                    style: Theme.of(context).textTheme.display1),
                Text(
                  'cm',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            Expanded(child: Container()),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbColor: BmiColors.pink,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                overlayColor: BmiColors.pink.withAlpha(38),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                activeTrackColor: BmiColors.white,
                inactiveTrackColor: BmiColors.grey,
              ),
              child: Slider(
                value: value.toDouble(),
                onChanged: (newHeight) => onChange(newHeight),
                min: min.toDouble(),
                max: max.toDouble(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
