class Todo {
  final String title;
  final String subtitle;
  bool done;

  Todo({
    required this.title,
    required this.subtitle,
    this.done = false,
  });

  Todo copyWith({
    String? title,
    String? subtitle,
    bool? done,
  }) {
    return Todo(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      done: done ?? this.done,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      done: json['done'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'done': done,
    };
  }

  @override
  String toString() {
    return 'Todo{title: $title, subtitle: $subtitle, done: $done}';
  }
}
