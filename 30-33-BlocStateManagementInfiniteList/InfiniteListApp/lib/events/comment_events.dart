import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class CommentFetchedEvent extends CommentEvent {}