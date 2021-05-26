import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: Provider.of<TaskData>(context).tasks[index].name,
          isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
          checkboxcallback: (checkboxState) {
            Provider.of<TaskData>(context, listen: false).updateTask(
                Provider.of<TaskData>(context, listen: false).tasks[index]);
          },
          longpresscallback: () {
            Provider.of<TaskData>(context, listen: false).deleteTask(
                Provider.of<TaskData>(context, listen: false).tasks[index]);
          },
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}
