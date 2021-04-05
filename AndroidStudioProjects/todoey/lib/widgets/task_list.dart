import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/task_model.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final Task task = taskData.getTask(index);
            return TaskTile(
              taskTitle: task.text,
              isChecked: task.isDone,
              handleOnChange: (value) {
                taskData.toggleDone(index);
              },
              handleOnLongPress: () {
                taskData.removeTask(task);
              },
            );
          },
          itemCount: taskData.numberOfTasks,
        );
      },
    );
  }
}
