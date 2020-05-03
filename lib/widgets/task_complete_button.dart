import 'package:flutter/material.dart';

class TaskCompleteButton extends StatelessWidget {
  const TaskCompleteButton({
    Key key,
    @required this.color,
    @required this.onChanged,
    @required this.completed,
  }) : super(key: key);

  final Color color;
  final Function onChanged;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: color,
      value: completed,
      onChanged: onChanged,
    );
  }
}
