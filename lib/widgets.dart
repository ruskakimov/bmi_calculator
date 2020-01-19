import 'package:flutter/material.dart';

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
      padding: EdgeInsets.symmetric(vertical: 24),
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: child,
    );
  }
}
