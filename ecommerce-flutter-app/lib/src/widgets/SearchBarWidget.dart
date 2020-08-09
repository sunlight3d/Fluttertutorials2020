import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.10), offset: Offset(0, 4), blurRadius: 10)
        ],
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: 'Search',
              hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.8)),
              prefixIcon: Icon(UiIcons.loupe, size: 20, color: Theme.of(context).hintColor),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(UiIcons.settings_2, size: 20, color: Theme.of(context).hintColor.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
