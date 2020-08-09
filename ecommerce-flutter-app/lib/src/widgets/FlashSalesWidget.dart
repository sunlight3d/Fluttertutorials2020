import 'dart:async';

import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class FlashSalesHeaderWidget extends StatefulWidget {
  const FlashSalesHeaderWidget({
    Key key,
  }) : super(key: key);

  @override
  _FlashSalesHeaderWidgetState createState() => _FlashSalesHeaderWidgetState();
}

class _FlashSalesHeaderWidgetState extends State<FlashSalesHeaderWidget> {
  String _timer;
  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        leading: Icon(
          UiIcons.megaphone,
          color: Theme.of(context).hintColor,
        ),
        title: Text(
          'Flash Sales',
          style: Theme.of(context).textTheme.display1,
        ),
        trailing: Text('End in $_timer'),
      ),
    );
  }

  void _initTimer() {
    var _now = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _now = _now.subtract(Duration(seconds: 1));
          _timer = DateFormat('HH:mm:ss').format(_now);
        });
      }
    });
  }
}
