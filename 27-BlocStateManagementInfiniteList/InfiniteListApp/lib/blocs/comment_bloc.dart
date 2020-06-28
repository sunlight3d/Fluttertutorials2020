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
    //now check your event ?
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

          }
        }catch(_) {
          yield CommentStateFailure();
        }
        //what about CommentStateFailure ?
      }
  }
  Future< List<Comment> >_getCommentsFromApi(int page, int limit) async{
    final url = 'https://jsonplaceholder.typicode.com/comments?_start=$page&_limit=$limit';
    this.httpClient.get(url).then((response) {
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
    });
    //In Order to use Bloc, use must define Event, State, Bloc,...
  }
}