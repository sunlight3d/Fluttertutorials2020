import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/product.dart';
import 'package:ecommerce_app_ui_kit/src/models/route_argument.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoriteListItemWidget extends StatefulWidget {
  String heroTag;
  Product product;
  VoidCallback onDismissed;

  FavoriteListItemWidget({Key key, this.heroTag, this.product, this.onDismissed}) : super(key: key);

  @override
  _FavoriteListItemWidgetState createState() => _FavoriteListItemWidgetState();
}

class _FavoriteListItemWidgetState extends State<FavoriteListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(this.widget.product.hashCode.toString()),
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
            .showSnackBar(SnackBar(content: Text("The ${widget.product.name} product is removed from wish list")));
      },
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        focusColor: Theme.of(context).accentColor,
        highlightColor: Theme.of(context).primaryColor,
        onTap: () {
          Navigator.of(context).pushNamed('/Product',
              arguments: new RouteArgument(
                  argumentsList: [this.widget.product, this.widget.heroTag], id: this.widget.product.id));
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
                tag: widget.heroTag + widget.product.id,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(image: AssetImage(widget.product.image), fit: BoxFit.cover),
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
                            widget.product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          Row(
                            children: <Widget>[
                              // The title of the product
                              Text(
                                '${widget.product.sales} Sales',
                                style: Theme.of(context).textTheme.body1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Text(
                                widget.product.rate.toString(),
                                style: Theme.of(context).textTheme.body2,
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(widget.product.getPrice(), style: Theme.of(context).textTheme.display1),
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
