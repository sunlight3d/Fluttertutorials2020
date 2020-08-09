import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/order.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/EmptyOrdersProductsWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/OrderGridItemWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/OrderListItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OrdersProductsWidget extends StatefulWidget {
  List<Order> ordersList;

  @override
  _OrdersProductsWidgetState createState() => _OrdersProductsWidgetState();

  OrdersProductsWidget({Key key, this.ordersList}) : super(key: key);
}

class _OrdersProductsWidgetState extends State<OrdersProductsWidget> {
  String layout = 'list';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Offstage(
            offstage: widget.ordersList.isEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                leading: Icon(
                  UiIcons.inbox,
                  color: Theme.of(context).hintColor,
                ),
                title: Text(
                  'Orders List',
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.display1,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        setState(() {
                          this.layout = 'list';
                        });
                      },
                      icon: Icon(
                        Icons.format_list_bulleted,
                        color: this.layout == 'list' ? Theme.of(context).accentColor : Theme.of(context).focusColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          this.layout = 'grid';
                        });
                      },
                      icon: Icon(
                        Icons.apps,
                        color: this.layout == 'grid' ? Theme.of(context).accentColor : Theme.of(context).focusColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Offstage(
            offstage: this.layout != 'list' || widget.ordersList.isEmpty,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: false,
              itemCount: widget.ordersList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                return OrderListItemWidget(
                  heroTag: 'orders_list',
                  order: widget.ordersList.elementAt(index),
                  onDismissed: () {
                    setState(() {
                      widget.ordersList.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          Offstage(
            offstage: this.layout != 'grid' || widget.ordersList.isEmpty,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: new StaggeredGridView.countBuilder(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: 4,
                itemCount: widget.ordersList.length,
                itemBuilder: (BuildContext context, int index) {
                  Order order = widget.ordersList.elementAt(index);
                  return OrderGridItemWidget(
                    order: order,
                    heroTag: 'orders_grid',
                  );
                },
//                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(index % 2 == 0 ? 1 : 2),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
              ),
            ),
          ),
          Offstage(
            offstage: widget.ordersList.isNotEmpty,
            child: EmptyOrdersProductsWidget(),
          )
        ],
      ),
    );
  }
}
