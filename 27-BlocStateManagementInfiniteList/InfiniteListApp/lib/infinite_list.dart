import 'package:InfiniteListApp/blocs/comment_bloc.dart';
import 'package:InfiniteListApp/states/CommentState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class InfiniteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfiniteList();
}
class _InfiniteList extends State<InfiniteList> {
  CommentBloc _commentBloc;
  //scrollController
  final _scrollController = ScrollController();
  final _scrollThreshold = 300.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _commentBloc = BlocProvider.of<CommentBloc>(context);
    _scrollController.addListener(_onScroll);
  }
  _onScroll(){

  }
  @override
  Widget build(BuildContext context) {
    //Data is get from API Server()
    //we use JSONPlaceHolder for testing
    //https://jsonplaceholder.typicode.com/comments?_start=1&_limit=20
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (blockBuilderContext, state) {
            //Check state here
            if(state is CommentStateInitial) {
              return Center(child: CircularProgressIndicator());
            }
            if(state is CommentStateFailure) {
              return Center(child: Text('Cannot load comments from Server'));
            }
            if(state is CommentStateSuccess) {
              var currentState = state as CommentStateSuccess;
              if(currentState.comments.isEmpty) {
                if(state is CommentStateFailure) {
                  return Center(child: Text('Empty comments !'));
                }
              }
              return ListView.builder(
                  itemBuilder: (BuildContext buildContext, int index) {
                    if(index >= currentState.comments.length) {
                      return Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: SizedBox(
                            width: 50,height: 50,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return ListTile(
                        leading: Text(
                            '${currentState.comments[index].id}',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                            '${currentState.comments[index].email}',
                          style: TextStyle(fontSize: 20),
                        ),
                        isThreeLine: true,
                        subtitle: Text(
                            '${currentState.comments[index].body}',
                          style: TextStyle(fontSize: 20),
                        ),
                        dense: true,
                      );
                    }
                  }
              );
            }
            return null;//never run this line !
          },
        )
      ),
    );
  }
}