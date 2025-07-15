class TodoModel {
    TodoModel({
         this.total,
         this.todos,
         this.skip,
         this.limit,
    });

    final List<Todo>? todos;
    final num? total;
    final num? skip;
    final num? limit;

    factory TodoModel.fromJson(Map<String, dynamic> json){ 
        return TodoModel(
            todos: json["todos"] == null ? [] : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
            total: json["total"] ?? 0,
            skip: json["skip"] ?? 0,
            limit: json["limit"] ?? 0,
        );
    }

    Map<String, dynamic> toJson() => {
        "todos": todos?.map((x) => x?.toJson()).toList(),
        "total": total,
        "skip": skip,
        "limit": limit,
    };

}

class Todo {
    Todo({
        required this.id,
        required this.todo,
        required this.completed,
        required this.userId,
    });

    final int id;
    final String todo;
    final bool completed;
    final num userId;

    factory Todo.fromJson(Map<String, dynamic> json){ 
        return Todo(
            id: json["id"] ?? 0,
            todo: json["todo"] ?? "",
            completed: json["completed"] ?? false,
            userId: json["userId"] ?? 0,
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
    };

}
