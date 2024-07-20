class Task {
  String title;
  String subtitle;
  bool stateValue;

  Task(this.title, this.subtitle, this.stateValue);

  void toogleState() {
    stateValue = !stateValue;
  }
}

List<Task> tasks = [
  Task('app dev', 'done todoapp', false),
];
