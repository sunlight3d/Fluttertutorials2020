import 'package:InfiniteListApp/events/comment_events.dart';
import 'package:InfiniteListApp/models/comment.dart';
import 'package:InfiniteListApp/states/CommentState.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final http.Client httpClient = http.Client();
  @override
  CommentState get initialState => CommentStateInitial();
  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async*{
    //Now update your UI !
    if(event is CommentFetchedEvent &&
        !(state is CommentStateSuccess && (state as CommentStateSuccess).hasReachedEnd))
      {
        try {
          if(state is CommentStateInitial) {
            //get first page(from API)
            final comments = await this._getCommentsFromApi(0, 20);
            yield CommentStateSuccess(
              comments: comments,
              hasReachedEnd: false
            );
          } else if(state is CommentStateSuccess) {
            int currentPage = (state as CommentStateSuccess).comments.length;
            final comments = await this._getCommentsFromApi(currentPage, 20);
            if(comments.isEmpty) {
              yield (state as CommentStateSuccess).cloneWith(hasReachedEnd: true);
            } else {
              //not scroll to end !
              yield CommentStateSuccess(
                comments: (state as CommentStateSuccess).comments + comments,
                hasReachedEnd: false
              );
            }
          }
        }catch(_) {
          yield CommentStateFailure();
        }
        //what about CommentStateFailure ?
      }
  }
  Future< List<Comment> >_getCommentsFromApi(int page, int limit) async{
    final url = 'https://jsonplaceholder.typicode.com/comments?_start=$page&_limit=$limit';
    try {
      final response = await this.httpClient.get(url);
      if(response.statusCode == 200) {
        final responseData = json.decode(response.body) as List;
        final List<Comment> comments = responseData.map((element){
          return Comment(
              id: element['id'],
              name: element['name'],
              email: element['email'],
              body: element['body']
          );
        }).toList();
        return comments;
      } else {
        //failed
        return List<Comment>();
      }
    } catch(_) {
      return List<Comment>();
    }
  }
}