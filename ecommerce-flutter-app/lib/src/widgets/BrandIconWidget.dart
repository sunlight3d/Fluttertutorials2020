import 'package:ecommerce_app_ui_kit/src/models/brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandIconWidget extends StatefulWidget {
  Brand brand;
  String heroTag;
  double marginLeft;
  ValueChanged<String> onPressed;

  BrandIconWidget({Key key, this.brand, this.heroTag, this.marginLeft, this.onPressed}) : super(key: key);

  @override
  _BrandIconWidgetState createState() => _BrandIconWidgetState();
}

class _BrandIconWidgetState extends State<BrandIconWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0),
      margin: EdgeInsets.only(right: widget.marginLeft, top: 10, bottom: 10),
      child: buildSelectedBrand(context),
    );
  }

  InkWell buildSelectedBrand(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).accentColor,
      onTap: () {
        setState(() {
          widget.onPressed(widget.brand.id);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: widget.brand.selected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: <Widget>[
            Hero(
              tag: widget.heroTag + widget.brand.id,
              child: SvgPicture.asset(
                widget.brand.logo,
                color: widget.brand.selected ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                width: 50,
//                height: 18,
              ),
            ),
            SizedBox(width: 10),
            AnimatedSize(
              duration: Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              vsync: this,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: widget.brand.selected ? 18 : 0,
                  ),
                  Text(
                    widget.brand.selected ? widget.brand.rate.toString() : '',
                    style: Theme.of(context).textTheme.body2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
