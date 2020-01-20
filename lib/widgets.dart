import 'package:flutter/material.dart';

import 'colors.dart';
import 'bmi_icons.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar(this.title, {Key key})
      : preferredSize = const Size.fromHeight(90),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        boxShadow: [BoxShadow(blurRadius: 12)],
      ),
      constraints: BoxConstraints.expand(),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.value, {
    Key key,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      constraints: BoxConstraints.expand(height: 70),
      child: Center(
        child: Text(
          value,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key key,
    this.child,
    this.color,
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: child,
    );
  }
}

class StepperCard extends StatelessWidget {
  const StepperCard({
    Key key,
    @required this.title,
    @required this.value,
    @required this.onChange,
  }) : super(key: key);

  final String title;
  final int value;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.body1),
            SizedBox(height: 2),
            Text(value.toString(), style: Theme.of(context).textTheme.display1),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => onChange(-1),
                  child: Container(
                    child: Minus(),
                    constraints: BoxConstraints.tight(Size.square(56)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () => onChange(1),
                  child: Container(
                    child: Plus(),
                    constraints: BoxConstraints.tight(Size.square(54)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).accentColor,
                    ),
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

class Minus extends StatelessWidget {
  const Minus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          constraints: BoxConstraints.tight(Size(2, 20)),
          color: BmiColors.white,
        ),
      ),
    );
  }
}

class Plus extends StatelessWidget {
  const Plus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RotatedBox(
            quarterTurns: 1,
            child: Container(
              constraints: BoxConstraints.tight(Size(2, 20)),
              color: BmiColors.white,
            ),
          ),
          Container(
            constraints: BoxConstraints.tight(Size(2, 20)),
            color: BmiColors.white,
          ),
        ],
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
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () => onSwitch(true),
            child: GenderCard(
              isMale: true,
              isSelected: male,
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: GestureDetector(
            onTap: () => onSwitch(false),
            child: GenderCard(
              isMale: false,
              isSelected: !male,
            ),
          ),
        ),
      ],
    );
  }
}

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key key,
    @required this.isMale,
    @required this.isSelected,
  }) : super(key: key);

  final bool isMale;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1;
    final body2 = Theme.of(context).textTheme.body2;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              isMale ? Bmi.male : Bmi.female,
              size: 56,
              color: isSelected ? BmiColors.white : BmiColors.grey,
            ),
            Text(
              isMale ? 'MALE' : 'FEMALE',
              style: isSelected ? body2 : body1,
            ),
          ],
        ),
      ),
      color: Theme.of(context).accentColor,
    );
  }
}
