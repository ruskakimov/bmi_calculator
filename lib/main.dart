import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'widgets.dart' as widgets;

void main() {
  runApp(BMICalculator());
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
            letterSpacing: 0.5,
          ),
          body2: TextStyle(
            fontSize: 16,
            color: BmiColors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
      home: Stack(
        children: <Widget>[
          Scaffold(
            appBar: widgets.AppBar('BMI CALCULATOR'),
            body: InputPage(),
          ),
          Opacity(
            opacity: 0,
            child: Image(
              image: AssetImage('images/selector_page.png'),
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              fit: BoxFit.contain,
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
        GestureDetector(
          onTap: () {
            print('works');
          },
          child: Container(
            color: Colors.red,
            height: 100,
            width: 200,
          ),
        ),
        RaisedButton(
          onPressed: () {
            print('lol');
          },
        ),
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
                        child: widgets.Card(),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: widgets.Card(),
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
        GestureDetector(
          onTap: () {
            print('works');
          },
          child: Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (_) {
              print('down!');
            },
            onTap: () {
              print('tap male');
              onSwitch(true);
            },
            child: widgets.Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'MALE',
                    style: male ? body2 : body1,
                  ),
                ],
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'FEMALE',
                    style: male ? body1 : body2,
                  ),
                ],
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
