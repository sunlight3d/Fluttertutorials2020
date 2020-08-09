import 'package:TodoAppBloc/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnSaveCallbackFunction = Function(String tasksName, String taskDetail); //function pointer
class InsertUpdateTodoScreen extends StatefulWidget {
  final bool isEditing;//Edit or insert
  final OnSaveCallbackFunction onSave;
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
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                TextFormField(
                  initialValue: isEditing ? widget.todo.taskName : '',
                  autofocus: !isEditing,
                  style: Theme.of(context).textTheme.headline5,
                  decoration: InputDecoration(
                    hintText: 'Enter your task\'s name',
                  ),
                  validator: (value) {
                    return value.trim().isEmpty ? 'Enter your task\' name'  : null;
                  },
                  onSaved: (value) => _taskName = value,
                ),
                TextFormField(
                  initialValue: isEditing ? widget.todo.taskDetail : '',
                  maxLines: 5,
                  style: Theme.of(context).textTheme.headline6,
                  decoration: InputDecoration(
                    hintText: 'Enter your task\'s detail',
                  ),
                  onSaved: (value) => _taskDetail = value,
                ),
                Padding(padding: EdgeInsets.only(top: 15)),
                RaisedButton(
                    child: Text(
                      isEditing ? 'Save changes' : 'Insert Todo',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
                    ),
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    onPressed:() {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        widget.onSave(_taskName, _taskDetail);
                        Navigator.pop(context);
                      }
                    }
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
