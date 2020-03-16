import 'package:flutter/material.dart';
import 'package:tsker/data/task.dart';

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(widget.task.title),
    );
  }
}
