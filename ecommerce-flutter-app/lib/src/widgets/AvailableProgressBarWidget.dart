import 'package:flutter/material.dart';

class AvailableProgressBarWidget extends StatelessWidget {
  const AvailableProgressBarWidget({
    Key key,
    @required this.available,
  }) : super(key: key);

  final double available;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 4,
          decoration: BoxDecoration(color: Theme.of(context).focusColor, borderRadius: BorderRadius.circular(6)),
        ),
        Container(
          width: available,
          height: 4,
          decoration: BoxDecoration(
              color: available > 30 ? Theme.of(context).accentColor : Colors.deepOrange,
              borderRadius: BorderRadius.circular(6)),
        ),
      ],
    );
  }
}
