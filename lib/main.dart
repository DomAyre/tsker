import 'package:flutter/material.dart';
import 'package:tsker/style/app_theme.dart';
import 'package:tsker/widgets/tasks_card.dart';

import 'data/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaskManager taskManager = TaskManager(allTasks: [
      Task(
        title: "Make a really good task app",
        scheduledTimes: [DateTime.now()],
      ),
      Task(
        title: "Sell the app",
        scheduledTimes: [DateTime.now()],
      ),
      Task(
        title: "Make much money",
        scheduledTimes: [DateTime.now().subtract(Duration(days: 1))],
      ),
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: Material(
        color: Colors.blue,
        child: Center(
          child: TaskCard(tasks: taskManager.getTasksOnDay(DateTime.now())),
        ),
      ),
    );
  }
}
