import 'package:flutter/foundation.dart';
import '../models/task.dart';
import '../services/local_storage_service.dart';
import 'package:uuid/uuid.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  final _storage = LocalStorageService();

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    _tasks = await _storage.loadTasks();
    notifyListeners();
  }

  void addTask(String title) {
    final task = Task(id: Uuid().v4(), title: title);
    _tasks.add(task);
    _storage.saveTasks(_tasks);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    _storage.saveTasks(_tasks);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _storage.saveTasks(_tasks);
    notifyListeners();
  }

  void sortByName() {
  _tasks.sort((a, b) => a.title.compareTo(b.title));
  notifyListeners();
}

void sortByStatus() {
  _tasks.sort((a, b) {
    if (a.isDone == b.isDone) return 0;
    return a.isDone ? 1 : -1; 
  });
  notifyListeners();
}

}
