


class TodoData {
  final String description;
  final bool completed;
  final String id;

  TodoData({
    required this.description,
    required this.completed,
    required this.id
});

  factory TodoData.fromJson(Map<String, dynamic>json){
    return TodoData(
        description: json['description'],
        completed: json['completed'],
        id: json['id']
    );
  }
}