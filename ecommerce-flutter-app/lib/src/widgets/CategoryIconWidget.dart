import 'package:ecommerce_app_ui_kit/src/models/category.dart';
import 'package:flutter/material.dart';

class CategoryIconWidget extends StatefulWidget {
  Category category;
  String heroTag;
  double marginLeft;
  ValueChanged<String> onPressed;

  CategoryIconWidget({Key key, this.category, this.heroTag, this.marginLeft, this.onPressed}) : super(key: key);

  @override
  _CategoryIconWidgetState createState() => _CategoryIconWidgetState();
}

class _CategoryIconWidgetState extends State<CategoryIconWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      margin: EdgeInsets.only(left: widget.marginLeft, top: 10, bottom: 10),
      child: buildSelectedCategory(context),
    );
  }

  InkWell buildSelectedCategory(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).accentColor,
      onTap: () {
        setState(() {
          widget.onPressed(widget.category.id);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: widget.category.selected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: <Widget>[
            Hero(
              tag: widget.heroTag + widget.category.id,
              child: Icon(
                widget.category.icon,
                color: widget.category.selected ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
            SizedBox(width: 10),
            AnimatedSize(
              duration: Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              vsync: this,
              child: Text(
                widget.category.selected ? widget.category.name : '',
                style: TextStyle(fontSize: 14, color: Theme.of(context).accentColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
