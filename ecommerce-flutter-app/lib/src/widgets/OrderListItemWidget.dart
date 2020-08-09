import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/order.dart';
import 'package:ecommerce_app_ui_kit/src/models/route_argument.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderListItemWidget extends StatefulWidget {
  String heroTag;
  Order order;
  VoidCallback onDismissed;

  OrderListItemWidget({Key key, this.heroTag, this.order, this.onDismissed}) : super(key: key);

  @override
  _OrderListItemWidgetState createState() => _OrderListItemWidgetState();
}

class _OrderListItemWidgetState extends State<OrderListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.widget.order.hashCode.toString()),
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
          widget.onDismissed();
        });

        // Then show a snackbar.
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("The ${widget.order.product.name} order is removed from wish list")));
      },
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        focusColor: Theme.of(context).accentColor,
        highlightColor: Theme.of(context).primaryColor,
        onTap: () {
          Navigator.of(context).pushNamed('/Product',
              arguments: new RouteArgument(argumentsList: [this.widget.heroTag], id: this.widget.order.product.id));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            boxShadow: [
              BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: widget.heroTag + widget.order.product.id,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(image: AssetImage(widget.order.product.image), fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.order.product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          SizedBox(height: 12),
                          Wrap(
                            spacing: 10,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    UiIcons.calendar,
                                    color: Theme.of(context).focusColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.order.getDateTime(),
                                    style: Theme.of(context).textTheme.body1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    UiIcons.line_chart,
                                    color: Theme.of(context).focusColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    widget.order.trackingNumber,
                                    style: Theme.of(context).textTheme.body1,
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ],
//                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(widget.order.product.getPrice(), style: Theme.of(context).textTheme.display1),
                        SizedBox(height: 6),
                        Chip(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          backgroundColor: Colors.transparent,
                          shape: StadiumBorder(side: BorderSide(color: Theme.of(context).focusColor)),
                          label: Text(
                            'x ${widget.order.quantity}',
                            style: TextStyle(color: Theme.of(context).focusColor),
                          ),
                        ),
                      ],
                    ),
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
