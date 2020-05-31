import 'package:flutter/material.dart';
import 'my_app.dart';
import 'favorites_page.dart';
class TabPage extends StatefulWidget {

  @override
  State<TabPage> createState() {
    // TODO: implement createState
    return _TabPage();
  }
}
class _TabPage extends State<TabPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int tabIndex = 0;
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      MyApp(),
      FavoritesPage()
    ];
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: listScreens[tabIndex],
          key: _scaffoldKey,
          drawer: Drawer(
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  /*
              DrawerHeader(
                child: Text('Choose something'),
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"),
                        fit: BoxFit.fitHeight,

                    )
                ),
              ),
               */
                  ListTile(
                    leading: CircleAvatar(backgroundImage: AssetImage("assets/images/profile.jpg"),),
                    title: Text('Nguyen Duc Hoang'),
                  ),
                  ListTile(
                    title: Text('Categories'),
                    onTap: () {
                      setState(() {
                        tabIndex = 0;
                        Navigator.pop(context);
                      });

                    },
                  ),
                  ListTile(
                    title: Text('Favorites'),
                    onTap: () {
                      setState(() {
                        tabIndex = 1;
                        Navigator.pop(context);
                      });

                    },
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[400],
              backgroundColor: Colors.cyan,
              currentIndex: tabIndex,
              onTap: (int index) {
                setState(() {
                  tabIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Categories', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Favorites', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                ),
              ]),
        ),
      )
    );
  }
}