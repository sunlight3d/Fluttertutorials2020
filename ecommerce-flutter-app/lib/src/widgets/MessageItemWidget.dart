import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/conversation.dart' as model;
import 'package:ecommerce_app_ui_kit/src/models/user.dart';
import 'package:flutter/material.dart';

class MessageItemWidget extends StatefulWidget {
  MessageItemWidget({Key key, this.message, this.onDismissed}) : super(key: key);
  model.Conversation message;
  ValueChanged<model.Conversation> onDismissed;

  @override
  _MessageItemWidgetState createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.widget.message.hashCode.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              UiIcons.trash,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onDismissed: (direction) {
        // Remove the item from the data source.
        setState(() {
          widget.onDismissed(widget.message);
        });

        // Then show a snackbar.
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("The conversation with ${widget.message.user.name} is dismissed")));
      },
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/Tabs', arguments: 5);
        },
        child: Container(
          color: this.widget.message.read ? Colors.transparent : Theme.of(context).focusColor.withOpacity(0.15),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(this.widget.message.user.avatar),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    right: 3,
                    width: 12,
                    height: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.message.user.userState == UserState.available
                            ? Colors.green
                            : widget.message.user.userState == UserState.away ? Colors.orange : Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 15),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      this.widget.message.user.name,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            this.widget.message.chats[0].text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.caption.merge(
                                TextStyle(fontWeight: this.widget.message.read ? FontWeight.w300 : FontWeight.w600)),
                          ),
                        ),
                        Text(
                          this.widget.message.chats[0].time,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Theme.of(context).textTheme.body1,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
