import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';

final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) {
  return TasksNotifier();
});

class TasksNotifier extends StateNotifier<List<Task>> {
  TasksNotifier() : super([]);

  void addTask(String title) {
    state = [...state, Task(title: title)];
  }

  void toggleTaskCompletion(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Task(title: state[i].title, isComplete: !state[i].isComplete)
        else
          state[i],
    ];
  }
}
