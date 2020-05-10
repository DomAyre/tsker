import 'package:flutter/material.dart';
import 'package:tsker/data/task.dart';
import 'package:tsker/style/constants.dart';
import 'package:tsker/style/text_style.dart';
import 'package:tsker/widgets/task_complete_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final Color color;

  TaskTile(this.task, {this.color = Colors.blue});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool completed;
  bool selected;

  _TaskTileState({this.completed = false, this.selected = false});

  _onCompleted() {
    print("Completed");
    setState(() {
      completed = true;
    });
    if (this.selected) _onEndWork();
  }

  _onUncompleted() {
    print("Uncompleted");
    setState(() {
      completed = false;
    });
  }

  _onCompletedPress(bool newValue) {
    if (newValue)
      _onCompleted();
    else
      _onUncompleted();
  }

  _onStartWork() {
    setState(() {
      this.selected = true;
    });
    if (this.completed) _onUncompleted();
  }

  _onEndWork() {
    setState(() {
      this.selected = false;
    });
  }

  _onWorkPress() {
    if (this.selected)
      _onEndWork();
    else
      _onStartWork();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: standardWidthConstraints,
      child: Card(
        elevation: this.selected ? 5 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: roundedBorder,
        ),
        color: this.selected ? widget.color : Colors.white,
        child: ClipRRect(
          borderRadius: roundedBorder,
          child: Slidable(
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.5,
            secondaryActions: <Widget>[
              IconSlideAction(
                color: this.selected ? Colors.white : widget.color,
                icon: Icons.timer,
                caption: this.selected ? "Stop Work" : "Start Work",
                onTap: _onWorkPress,
              )
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TaskCompleteButton(
                    color: widget.color,
                    onChanged: _onCompletedPress,
                    completed: completed,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.task.title,
                            style: textStyle.copyWith(
                              color:
                                  this.selected ? Colors.white : widget.color,
                            ),
                          ),
                          Visibility(
                            visible: this.selected,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "${widget.task.timeLogged.inHours}h ${widget.task.timeLogged.inMinutes}m ${widget.task.timeLogged.inSeconds}s",
                                style: textStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: blackText,
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
