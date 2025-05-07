import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(labelText: 'Nouvelle tâche'),
          ),
          ElevatedButton(
            child: Text('Ajouter'),
            onPressed: () {
              context.read<TaskData>().addTask(controller.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
