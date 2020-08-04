import 'package:TodoAppBloc/blocs/blocs.dart';
import 'package:TodoAppBloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, statisticsState) {
        if (statisticsState is StatisticsStateLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (statisticsState is StatisticsStateLoaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Completed Todos',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    '${statisticsState.numberOfCompletedTodos}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Active Todos',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    "${statisticsState.numberOfActiveTodos}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
