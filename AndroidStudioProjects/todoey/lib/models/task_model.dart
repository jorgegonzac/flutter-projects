import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(text: 'Buy fruit'),
    Task(text: 'Buy milk'),
    Task(text: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get numberOfTasks => _tasks.length;

  void add(String textTitle) {
    _tasks.add(
      Task(
        text: textTitle,
      ),
    );
    notifyListeners();
  }

  void toggleDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  Task getTask(int index) {
    return _tasks[index];
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
