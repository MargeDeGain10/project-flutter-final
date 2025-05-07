import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';
import 'task_title.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskData>().tasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, i) => TaskTile(task: tasks[i]),
    );
  }
}
