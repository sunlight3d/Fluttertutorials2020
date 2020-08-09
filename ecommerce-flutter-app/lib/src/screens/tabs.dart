import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/screens/account.dart';
import 'package:ecommerce_app_ui_kit/src/screens/chat.dart';
import 'package:ecommerce_app_ui_kit/src/screens/favorites.dart';
import 'package:ecommerce_app_ui_kit/src/screens/home.dart';
import 'package:ecommerce_app_ui_kit/src/screens/messages.dart';
import 'package:ecommerce_app_ui_kit/src/screens/notifications.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/FilterWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabsWidget extends StatefulWidget {
  int currentTab = 2;
  int selectedTab = 2;
  String currentTitle = 'Home';
  Widget currentPage = HomeWidget();

  TabsWidget({
    Key key,
    this.currentTab,
  }) : super(key: key);

  @override
  _TabsWidgetState createState() {
    return _TabsWidgetState();
  }
}

class _TabsWidgetState extends State<TabsWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  initState() {
    _selectTab(widget.currentTab);
    super.initState();
  }

  @override
  void didUpdateWidget(TabsWidget oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      widget.selectedTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentTitle = 'Notifications';
          widget.currentPage = NotificationsWidget();
          break;
        case 1:
          widget.currentTitle = 'Account';
          widget.currentPage = AccountWidget();
          break;
        case 2:
          widget.currentTitle = 'Home';
          widget.currentPage = HomeWidget();
          break;
        case 3:
          widget.currentTitle = 'Messages';
          widget.currentPage = MessagesWidget();
          break;
        case 4:
          widget.currentTitle = 'Favorites';
          widget.currentPage = FavoritesWidget();
          break;
        case 5:
          widget.selectedTab = 3;
          widget.currentTitle = 'Chat';
          widget.currentPage = ChatWidget();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      endDrawer: FilterWidget(),
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
          widget.currentTitle,
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
      body: widget.currentPage,
//      bottomNavigationBar: CurvedNavigationBar(
//        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//        buttonBackgroundColor: Theme.of(context).accentColor,
//        color: Theme.of(context).focusColor.withOpacity(0.2),
//        height: 60,
//        index: widget.selectedTab,
//        onTap: (int i) {
//          this._selectTab(i);
//        },
//        items: <Widget>[
//          Icon(
//            UiIcons.bell,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.user_1,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.home,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.chat,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//          Icon(
//            UiIcons.heart,
//            size: 23,
//            color: Theme.of(context).focusColor,
//          ),
//        ],
//      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 22,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(size: 25),
        unselectedItemColor: Theme.of(context).hintColor.withOpacity(1),
        currentIndex: widget.selectedTab,
        onTap: (int i) {
          this._selectTab(i);
        },
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(UiIcons.bell),
            title: new Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(UiIcons.user_1),
            title: new Container(height: 0.0),
          ),
          BottomNavigationBarItem(
              title: new Container(height: 5.0),
              icon: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                    BoxShadow(
                        color: Theme.of(context).accentColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
                  ],
                ),
                child: new Icon(UiIcons.home, color: Theme.of(context).primaryColor),
              )),
          BottomNavigationBarItem(
            icon: new Icon(UiIcons.chat),
            title: new Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: new Icon(UiIcons.heart),
            title: new Container(height: 0.0),
          ),
        ],
      ),
    );
  }
}
