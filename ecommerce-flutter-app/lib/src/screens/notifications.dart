import 'package:ecommerce_app_ui_kit/src/models/notification.dart' as model;
import 'package:ecommerce_app_ui_kit/src/widgets/EmptyNotificationsWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/NotificationItemWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatefulWidget {
  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  model.NotificationList _notificationList;

  @override
  void initState() {
    this._notificationList = new model.NotificationList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBarWidget(),
            ),
            Offstage(
              offstage: _notificationList.notifications.isEmpty,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 15),
                shrinkWrap: true,
                primary: false,
                itemCount: _notificationList.notifications.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 7);
                },
                itemBuilder: (context, index) {
                  return NotificationItemWidget(
                    notification: _notificationList.notifications.elementAt(index),
                    onDismissed: (notification) {
                      setState(() {
                        _notificationList.notifications.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
            Offstage(
              offstage: _notificationList.notifications.isNotEmpty,
              child: EmptyNotificationsWidget(),
            )
          ],
        ),
      ),
    );
  }
}
