import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../data/task_data.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (_) => context.read<TaskData>().toggleTask(task),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => context.read<TaskData>().deleteTask(task),
      ),
    );
  }
}
