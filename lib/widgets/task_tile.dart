import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  const TaskTile({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        tileColor: const Color.fromARGB(255, 232, 232, 232),
        leading: Checkbox(
          value: task.isComplete,
          onChanged: (_) => onToggle(),
          activeColor: Colors.blueAccent,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: task.isComplete
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: task.isComplete ? Colors.green : Colors.orange,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            task.isComplete ? 'Completed' : 'Pending',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
