import 'package:TodoAppBloc/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final MyAppTab activeTab;
  final Function(MyAppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: MyAppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(MyAppTab.values[index]),
      items: MyAppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == MyAppTab.todos ? Icons.list : Icons.show_chart,
          ),
          title: Text(
            tab == MyAppTab.statistics ? 'Statistics' : 'Todos',
          ),
        );
      }).toList(),
    );
  }
}
