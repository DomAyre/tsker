import 'package:flutter/material.dart';
import 'package:tsker/style/app_theme.dart';
import 'package:tsker/widgets/task_tile.dart';

import 'data/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Task exampleTask = Task(
        title:
            "Make a really really really really really really really really really good task app");

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: Material(
        child: Center(
          child: TaskTile(exampleTask, color: Colors.green),
        ),
      ),
    );
  }
}
