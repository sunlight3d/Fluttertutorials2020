import 'package:ecommerce_app_ui_kit/src/models/conversation.dart' as model;
import 'package:ecommerce_app_ui_kit/src/widgets/EmptyMessagesWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/MessageItemWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/SearchBarWidget.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  model.ConversationsList _conversationList;
  @override
  void initState() {
    this._conversationList = new model.ConversationsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBarWidget(),
          ),
          Offstage(
            offstage: _conversationList.conversations.isEmpty,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 15),
              shrinkWrap: true,
              primary: false,
              itemCount: _conversationList.conversations.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 7);
              },
              itemBuilder: (context, index) {
                return MessageItemWidget(
                  message: _conversationList.conversations.elementAt(index),
                  onDismissed: (conversation) {
                    setState(() {
                      _conversationList.conversations.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          Offstage(
            offstage: _conversationList.conversations.isNotEmpty,
            child: EmptyMessagesWidget(),
          )
        ],
      ),
    );
  }
}
