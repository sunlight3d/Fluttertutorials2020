import 'package:ecommerce_app_ui_kit/config/app_config.dart' as config;
import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';

class CheckoutDoneWidget extends StatefulWidget {
  @override
  _CheckoutDoneWidgetState createState() => _CheckoutDoneWidgetState();
}

class _CheckoutDoneWidgetState extends State<CheckoutDoneWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(UiIcons.return_icon, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Checkout',
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: config.App(context).appHeight(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                          Theme.of(context).accentColor,
                          Theme.of(context).accentColor.withOpacity(0.2),
                        ])),
                    child: Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                      size: 70,
                    ),
                  ),
                  Positioned(
                    right: -30,
                    bottom: -50,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    top: -50,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(150),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Your payment was successfully processed',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.display2,
              ),
              SizedBox(height: 50),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/Orders');
                },
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                color: Theme.of(context).focusColor.withOpacity(0.15),
                shape: StadiumBorder(),
                child: Text(
                  'Your Orders',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
