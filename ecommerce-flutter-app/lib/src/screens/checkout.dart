import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/CreditCardsWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';

class CheckoutWidget extends StatefulWidget {
  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                leading: Icon(
                  UiIcons.credit_card,
                  color: Theme.of(context).hintColor,
                ),
                title: Text(
                  'Payment Mode',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.display1,
                ),
                subtitle: Text(
                  'Select your prefered payment mode',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            SizedBox(height: 20),
            CreditCardsWidget(),
            SizedBox(height: 40),
            Text(
              'Or Checkout With',
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 320,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/CheckoutDone');
                },
                padding: EdgeInsets.symmetric(vertical: 12),
                color: Theme.of(context).focusColor.withOpacity(0.2),
                shape: StadiumBorder(),
                child: Image.asset(
                  'img/paypal.png',
                  height: 28,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 320,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/CheckoutDone');
                },
                padding: EdgeInsets.symmetric(vertical: 12),
                color: Theme.of(context).focusColor.withOpacity(0.2),
                shape: StadiumBorder(),
                child: Image.asset(
                  'img/apple_pay.png',
                  height: 28,
                ),
              ),
            ),
            SizedBox(height: 20),
            Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget>[
                SizedBox(
                  width: 320,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/CheckoutDone');
                    },
                    padding: EdgeInsets.symmetric(vertical: 14),
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Confirm Payment',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '\$55.36',
                    style: Theme.of(context).textTheme.display1.merge(TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
