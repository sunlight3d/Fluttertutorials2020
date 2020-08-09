import 'package:ecommerce_app_ui_kit/config/ui_icons.dart';
import 'package:ecommerce_app_ui_kit/src/models/category.dart';
import 'package:ecommerce_app_ui_kit/src/models/route_argument.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/DrawerWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ProductsByCategoryWidget.dart';
import 'package:ecommerce_app_ui_kit/src/widgets/ShoppingCartButtonWidget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  RouteArgument routeArgument;
  Category _category;

  CategoryWidget({Key key, this.routeArgument}) {
    _category = this.routeArgument.argumentsList[0] as Category;
  }

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final SubCategoriesList _subCategoriesList = new SubCategoriesList();

  @override
  void initState() {
    _tabController =
        TabController(length: _subCategoriesList.list.length, initialIndex: widget.routeArgument.id, vsync: this);
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
        widget.routeArgument.id = _tabController.index;
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
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
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
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.10), offset: Offset(0, 4), blurRadius: 10)
                      ],
                      gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                        Theme.of(context).accentColor,
                        Theme.of(context).focusColor,
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: widget._category.id,
                        child: Icon(
                          widget._category.icon,
                          color: Theme.of(context).primaryColor,
                          size: 70,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget._category.name,
                        style:
                            Theme.of(context).textTheme.title.merge(TextStyle(color: Theme.of(context).primaryColor)),
                      )
                    ],
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
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Theme.of(context).primaryColor.withOpacity(0.6),
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
            isScrollable: true,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: List.generate(_subCategoriesList.list.length, (index) {
              return Tab(text: _subCategoriesList.list.elementAt(index).name);
            }),
          ),
        ),
        SliverToBoxAdapter(
          child: ProductsByCategoryWidget(
            subCategory: _subCategoriesList.list.elementAt(widget.routeArgument.id),
          ),
        ),
      ]),
    );
  }
}
