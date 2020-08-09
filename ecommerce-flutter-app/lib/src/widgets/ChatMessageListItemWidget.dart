import 'package:ecommerce_app_ui_kit/src/models/chat.dart';
import 'package:ecommerce_app_ui_kit/src/models/user.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  Chat chat;
  User currentUser = new User.init().getCurrentUser();
  final Animation animation;

  ChatMessageListItem({this.chat, this.animation});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child:
          currentUser.name == this.chat.user.name ? getSentMessageLayout(context) : getReceivedMessageLayout(context),
    );
  }

  Widget getSentMessageLayout(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).focusColor.withOpacity(0.2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(this.chat.user.name, style: Theme.of(context).textTheme.body2),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(chat.text),
                  ),
                ],
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: new CircleAvatar(
                      backgroundImage: AssetImage(this.chat.user.avatar),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getReceivedMessageLayout(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: new CircleAvatar(
                      backgroundImage: AssetImage(this.chat.user.avatar),
                    )),
              ],
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(this.chat.user.name,
                      style: Theme.of(context).textTheme.body2.merge(TextStyle(color: Theme.of(context).primaryColor))),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      chat.text,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
