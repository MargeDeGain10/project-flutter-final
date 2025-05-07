class Task {
  final String id;
  final String title;
  bool isDone;

  Task({required this.id, required this.title, this.isDone = false});

  void toggleDone() => isDone = !isDone;

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'isDone': isDone};

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        isDone: json['isDone'],
      );
}
