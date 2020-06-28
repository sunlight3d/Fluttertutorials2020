//enum CommentEvent {
//  commentFetchedEvent
//}
//are there other way to define Event ? => use class !
import 'package:equatable/equatable.dart';

abstract class CommentEvent extends Equatable{
  @override
  List<Object> get props => [];
}
class CommentFetchedEvent extends CommentEvent {}
//How to compare 2 object's content in Dart ? Let's use Equatable
//Now define states

