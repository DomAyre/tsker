class TaskWorkLog {
  DateTime start;
  DateTime end;

  TaskWorkLog({this.start});
  TaskWorkLog.now() {
    this.start = DateTime.now();
  }

  void endLog() {
    this.end = DateTime.now();
  }
}

class Task {
  String title;
  Duration timeLogged = Duration.zero;
  bool completed = false;
  List<DateTime> scheduledTimes = [];
  List<TaskWorkLog> workLogs = [];

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

  void completeTask(Task task) {
    task.completed = true;
  }

  void uncompleteTask(Task task) {
    task.completed = false;
  }

  void startTask(Task task) {
    assert(task.workLogs[-1].end != null);
    task.workLogs.add(TaskWorkLog.now());
  }

  void endTask(Task task) {
    TaskWorkLog lastLog = task.workLogs[-1];
    assert(lastLog.end == null);
    lastLog.endLog();
  }
}
