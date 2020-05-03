import 'package:flutter/material.dart';
import 'package:tsker/data/task.dart';
import 'package:tsker/style/text_style.dart';
import 'package:tsker/widgets/task_complete_button.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final bool selected;
  final Color color;

  TaskTile(this.task, {this.selected = false, this.color = Colors.blue});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool completed;

  _TaskTileState({this.completed = false});

  onCompleted() {
    print("Completed");
    setState(() {
      completed = true;
    });
  }

  onUncompleted() {
    print("Uncompleted");
    setState(() {
      completed = false;
    });
  }

  onCompletedPress(bool newValue) {
    if (newValue)
      onCompleted();
    else
      onUncompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: Card(
        elevation: widget.selected ? 8 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        color: widget.selected ? widget.color : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TaskCompleteButton(
                color: widget.color,
                onChanged: onCompletedPress,
                completed: completed,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    widget.task.title,
                    style: textStyle.copyWith(
                      color: widget.selected ? Colors.white : widget.color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
