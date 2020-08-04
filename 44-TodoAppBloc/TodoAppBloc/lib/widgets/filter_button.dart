import 'package:TodoAppBloc/blocs/blocs.dart';
import 'package:TodoAppBloc/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButton extends StatelessWidget {
  final bool visible;

  FilterButton({this.visible, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.subtitle1;
    final selecterStyle = Theme.of(context).textTheme.subtitle1
                          .copyWith(color: Colors.deepOrange);
    return BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
        builder: (context, filteredTodosState) {
        final activeFilter = filteredTodosState is FilteredTodosLoaded
            ? filteredTodosState.activeFilter
            : VisibilityFilter.all;
        final button = PopupMenuButton(
          tooltip: 'Filter Todos',
          onSelected: (filter) {
            BlocProvider.of<FilteredTodosBloc>(context).add(FilteredTodosEventUpdateFilter(filter));
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<VisibilityFilter>>[
            PopupMenuItem(
              value: VisibilityFilter.all,
              child: Text(
                'All Todos',
                style: activeFilter == VisibilityFilter.all
                    ? selecterStyle
                    : defaultStyle,
              ),
            ),
            PopupMenuItem(
              value: VisibilityFilter.active,
              child: Text(
                'Active Todos',
                style: activeFilter == VisibilityFilter.active
                    ? selecterStyle
                    : defaultStyle,
              ),
            ),
            PopupMenuItem(
              value: VisibilityFilter.completed,
              child: Text(
                'Completed Todos',
                style: activeFilter == VisibilityFilter.completed
                    ? selecterStyle
                    : defaultStyle,
              ),
            ),
          ],
          icon: Icon(Icons.filter_1_rounded),
        );
        //IgnorePointer => button that you cannot press !
      return visible ? button : IgnorePointer(child: button);
    });
  }
}