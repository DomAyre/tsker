import 'package:flutter/material.dart';
import 'package:tsker/style/app_theme.dart';
import 'package:tsker/widgets/tasks_card.dart';

import 'data/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task> exampleTasks = [
      Task(title: "Make a really good task app"),
      Task(title: "Sell the app"),
      Task(title: "Make much money"),
      Task(title: "Make a really good task app"),
      Task(title: "Sell the app"),
      Task(title: "Make much money"),
      Task(title: "Make a really good task app"),
      Task(title: "Sell the app"),
      Task(title: "Make much money"),
      Task(title: "Make a really good task app"),
      Task(title: "Sell the app"),
      Task(title: "Make much money"),
      Task(title: "Make a really good task app"),
      Task(title: "Sell the app"),
      Task(title: "Make much money"),
      Task(title: "Make a really good task app"),
      Task(title: "Sell the app"),
      Task(title: "Make much money"),
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: Material(
        color: Colors.blue,
        child: Center(
          child: TaskCard(tasks: exampleTasks),
        ),
      ),
    );
  }
}
