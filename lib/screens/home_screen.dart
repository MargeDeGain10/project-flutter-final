import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/task_data.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Mes Tâches', style: AppStyles.appBarTitle),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'name') context.read<TaskData>().sortByName();
              if (value == 'status') context.read<TaskData>().sortByStatus();
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'name', child: Text('Trier par nom')),
              PopupMenuItem(value: 'status', child: Text('Trier par statut')),
            ],
          )
        ],
      ),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.accent,
        child: Icon(Icons.add),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (_) => AddTaskScreen(),
        ),
      ),
    );
  }
}