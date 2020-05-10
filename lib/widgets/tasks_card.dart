import 'package:flutter/material.dart';
import 'package:tsker/data/task.dart';
import 'package:tsker/style/constants.dart';
import 'package:tsker/widgets/task_tile.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
    @required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: standardWidthConstraints.copyWith(maxHeight: 500),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: roundedBorder,
        ),
        child: ClipRRect(
          borderRadius: roundedBorder,
          child: ListView.builder(
            shrinkWrap: true,
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: TaskTile(tasks[index], color: Colors.green),
              );
            },
            itemCount: tasks.length,
          ),
        ),
      ),
    );
  }
}
