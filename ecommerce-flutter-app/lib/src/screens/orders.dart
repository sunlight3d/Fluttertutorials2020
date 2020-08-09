import 'package:ecommerce_app_ui_kit/src/models/order.dart';
import 'package:ecommerce_app_ui_kit/src/screens/orders_products.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';

class OrdersWidget extends StatefulWidget {
  int currentTab;
  OrdersWidget({Key key, this.currentTab}) : super(key: key);
  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final OrderList _orderList = new OrderList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: widget.currentTab ?? 0,
        length: 5,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerWidget(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
//        leading: new IconButton(
//          icon: new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
//          onPressed: () => Navigator.of(context).pop(),
//        ),
            leading: new IconButton(
              icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'My Orders',
              style: Theme.of(context).textTheme.display1,
            ),
            actions: <Widget>[
              new ShoppingCartButtonWidget(
                  iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
              Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: 20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(300),
                    onTap: () {
                      Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('img/user2.jpg'),
                    ),
                  )),
            ],
            bottom: TabBar(
                indicatorPadding: EdgeInsets.all(10),
                labelPadding: EdgeInsets.symmetric(horizontal: 5),
                unselectedLabelColor: Theme.of(context).accentColor,
                labelColor: Theme.of(context).primaryColor,
                isScrollable: true,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Theme.of(context).accentColor),
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Theme.of(context).accentColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("All"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Theme.of(context).accentColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Unpaid"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Theme.of(context).accentColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Shipped"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Theme.of(context).accentColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("To be shipped"),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Theme.of(context).accentColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("In Dispute"),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            OrdersProductsWidget(ordersList: _orderList.list),
            OrdersProductsWidget(
                ordersList: _orderList.list.where((order) => order.orderState == OrderState.unpaid).toList()),
            OrdersProductsWidget(
                ordersList: _orderList.list.where((order) => order.orderState == OrderState.shipped).toList()),
            OrdersProductsWidget(
                ordersList: _orderList.list.where((order) => order.orderState == OrderState.toBeShipped).toList()),
            OrdersProductsWidget(
                ordersList: _orderList.list.where((order) => order.orderState == OrderState.inDispute).toList()),
          ]),
        ));
  }
}
