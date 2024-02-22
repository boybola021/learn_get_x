


class TodoModel{
  String id;
  String title;
  String description;
  bool isCompleted;
  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.
    isCompleted,
  });
  factory TodoModel.fromJson(Map<String,Object?> json){
    return TodoModel(
      id: json["id"] as String,
      title: json["title"] as String,
      description: json["description"] as String,
      isCompleted : json["isCompleted"] as bool,
    );
  }
  Map<String,Object> toJson() => {
    "id":id,
    "title":title,
    "description":description,
    "save": isCompleted,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TodoModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              description == other.description &&
              isCompleted == other.isCompleted;

  @override
  int get hashCode => Object.hash(id,title,description,isCompleted);

}