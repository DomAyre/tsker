import 'package:flutter/material.dart';
import 'package:tsker/data/task.dart';
import 'package:tsker/style/text_style.dart';

class TaskTile extends StatefulWidget {
  final Task task;

  TaskTile(this.task);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          widget.task.title,
          style: textStyle,
        ),
      ),
    );
  }
}
