import 'package:TodoAppBloc/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

@immutable
class Todo {
  final String id;
  final bool isCompleted;
  final String taskName;
  final String taskDetail;

  Todo({this.id, this.isCompleted = false, this.taskName, this.taskDetail});

  @override
  int get hashCode =>
      isCompleted.hashCode ^ taskName.hashCode ^ taskDetail.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          isCompleted == other.isCompleted &&
          taskName == other.taskName &&
          taskDetail == other.taskDetail &&
          id == other.id;

  Todo copyWith({id, isCompleted, taskDetail, taskName}){
    return Todo(
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      taskName:taskName ?? this.taskName,
      taskDetail: taskDetail ?? this.taskDetail,
    );
  }
  @override
  String toString() {
    return 'Todo{complete: $isCompleted, task: $taskName, note: $taskDetail, id: $id}';
  }

  static Todo fromJson(Map<String, Object> json) {
    return Todo(
        id: json["id"] as String,
        taskName: json["taskName"] as String,
        taskDetail: json["taskDetail"] as String,
        isCompleted: json["isCompleted"] as bool
    );
  }

  static Todo fromSnapshot(DocumentSnapshot snap) {
    return Todo(
        id: snap.documentID,
        taskName: snap.data['taskName'],
        taskDetail: snap.data['taskDetail'],
        isCompleted: snap.data['isCompleted']
    );
  }

  Map<String, Object> toJson() {
    return {
      "id": this.id,
      "taskName": this.taskName,
      "taskDetail": this.taskDetail,
      "isCompleted": this.isCompleted,
    };
  }
}
