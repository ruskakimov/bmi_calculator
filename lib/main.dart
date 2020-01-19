import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'bmi_icons.dart';
import 'widgets.dart' as widgets;

void main() {
  runApp(BMICalculator());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF0A0D22),
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
                  child: GenderSwitcher(
                    male: _male,
                    onSwitch: (male) {
                      print(male);
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
                        child: StepperCard(title: 'WEIGHT'),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: StepperCard(title: 'AGE'),
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

class StepperCard extends StatelessWidget {
  const StepperCard({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return widgets.Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.body1),
            Text('74', style: Theme.of(context).textTheme.display1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Icon(Icons.arrow_downward, color: BmiColors.grey),
                  constraints: BoxConstraints.tight(Size.square(56)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  child: Icon(Icons.arrow_upward, color: BmiColors.grey),
                  constraints: BoxConstraints.tight(Size.square(54)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenderSwitcher extends StatelessWidget {
  const GenderSwitcher({
    Key key,
    this.male = true,
    @required this.onSwitch,
  }) : super(key: key);

  final bool male;
  final Function onSwitch;

  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1;
    final body2 = Theme.of(context).textTheme.body2;

    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () => onSwitch(true),
            child: widgets.Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Bmi.male,
                      size: 56,
                      color: male ? BmiColors.white : BmiColors.grey,
                    ),
                    Text(
                      'MALE',
                      style: male ? body2 : body1,
                    ),
                  ],
                ),
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: GestureDetector(
            onTap: () => onSwitch(false),
            child: widgets.Card(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Bmi.female,
                      size: 56,
                      color: male ? BmiColors.grey : BmiColors.white,
                    ),
                    Text(
                      'FEMALE',
                      style: male ? body1 : body2,
                    ),
                  ],
                ),
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
