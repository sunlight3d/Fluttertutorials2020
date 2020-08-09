import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/brand.dart';
import 'package:ecommerce_app_ui_kit/src/models/route_argument.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/BrandHomeTabWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ProductsByBrandWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ReviewsListWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandWidget extends StatefulWidget {
  RouteArgument routeArgument;
  Brand _brand;

  BrandWidget({Key key, this.routeArgument}) {
    _brand = this.routeArgument.argumentsList[0] as Brand;
  }

  @override
  _BrandWidgetState createState() => _BrandWidgetState();
}

class _BrandWidgetState extends State<BrandWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: _tabIndex, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _tabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          snap: true,
          floating: true,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            icon: new Icon(UiIcons.return_icon, color: Theme.of(context).primaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            new ShoppingCartButtonWidget(
                iconColor: Theme.of(context).primaryColor, labelColor: Theme.of(context).hintColor),
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
          backgroundColor: widget._brand.color,
          expandedHeight: 250,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                    widget._brand.color,
                    Theme.of(context).primaryColor.withOpacity(0.5),
                  ])),
                  child: Center(
                    child: Hero(
                      tag: widget._brand.id,
                      child: SvgPicture.asset(
                        widget._brand.logo,
                        color: Theme.of(context).primaryColor,
                        width: 130,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -60,
                  bottom: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(300),
                    ),
                  ),
                ),
                Positioned(
                  left: -30,
                  top: -80,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(150),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.8),
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Products'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Offstage(
              offstage: 0 != _tabIndex,
              child: Column(
                children: <Widget>[
                  BrandHomeTabWidget(brand: widget._brand),
                ],
              ),
            ),
            Offstage(
              offstage: 1 != _tabIndex,
              child: Column(
                children: <Widget>[ProductsByBrandWidget(brand: widget._brand)],
              ),
            ),
            Offstage(
              offstage: 2 != _tabIndex,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      leading: Icon(
                        UiIcons.chat_1,
                        color: Theme.of(context).hintColor,
                      ),
                      title: Text(
                        'Users Reviews',
                        overflow: TextOverflow.fade,
                        softWrap: false,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ),
                  ),
                  ReviewsListWidget()
                ],
              ),
            )
          ]),
        )
      ]),
    );
  }
}
