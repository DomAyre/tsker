class Task {
  String title;
  Duration timeLogged = Duration.zero;
  List<DateTime> scheduledTimes = [];

  Task({
    this.title,
    this.scheduledTimes,
  });
}

class TaskManager {
  List<Task> allTasks = List<Task>();

  TaskManager({
    this.allTasks,
  });

  List<Task> getTasksOnDay(DateTime date) => allTasks
      .where((task) => task.scheduledTimes.any((time) =>
          time.year == date.year &&
          time.month == date.month &&
          time.day == date.day))
      .toList();
}
