import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../data/task_data.dart';
import '../utils/constants.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  TaskTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: task.isDone ? AppStyles.taskTitleDone : AppStyles.taskTitle,
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (_) => context.read<TaskData>().toggleTask(task),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Supprimer la tâche ?'),
              content: Text('Cette action est irréversible.'),
              actions: [
                TextButton(
                  child: Text('Annuler'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text('Supprimer', style: TextStyle(color: AppColors.primary)),
                  onPressed: () {
                    context.read<TaskData>().deleteTask(task);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
