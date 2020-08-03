import 'package:TodoAppBloc/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnSaveCallback = Function(String tasksName, String taskDetail); //function pointer
class InsertUpdateTodoScreen extends StatefulWidget {
  final bool isEditing;//Edit or insert
  final OnSaveCallback onSave;
  final Todo todo;

  InsertUpdateTodoScreen({
    Key key,
    @required this.onSave,
    @required this.isEditing,
    this.todo,
  }) : super(key: key);

  @override
  _InsertUpdateTodoScreenState createState() => _InsertUpdateTodoScreenState();
}

class _InsertUpdateTodoScreenState extends State<InsertUpdateTodoScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _taskName;
  String _taskDetail;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Todo' : 'Add Todo',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: isEditing ? widget.todo.taskName : '',
                autofocus: !isEditing,
                style: textTheme.headline5,
                decoration: InputDecoration(
                  hintText: 'What needs to be done?',
                ),
                validator: (val) {
                  return val.trim().isEmpty ? 'Please enter some text' : null;
                },
                onSaved: (value) => _taskName = value,
              ),
              TextFormField(
                initialValue: isEditing ? widget.todo.taskDetail : '',
                maxLines: 10,
                style: textTheme.subtitle1,
                decoration: InputDecoration(
                  hintText: 'Additional Notes...',
                ),
                onSaved: (value) => _taskDetail = value,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: isEditing ? 'Save changes' : 'Add Todo',
        child: Icon(isEditing ? Icons.check : Icons.add),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            widget.onSave(_taskName, _taskDetail);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
