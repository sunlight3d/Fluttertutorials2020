// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:TodoAppBloc/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'todos_repository.dart';

class FirebaseTodosRepository implements TodosRepository {
  final todoCollection = Firestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(Todo todo) {
    final x = todo.toJson();
    return todoCollection.add(x);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return todoCollection.document(todo.id).delete();
  }

  @override
  Stream<List<Todo>> todos() {
    return todoCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((document) => Todo.fromSnapshot(document))
          .toList();
    });
  }

  @override
  Future<void> updateTodo(Todo updatedTodo) {
    return todoCollection
        .document(updatedTodo.id)
        .updateData(updatedTodo.toJson());
  }
}
