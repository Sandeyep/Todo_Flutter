import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/api%20test/controller/todo_controller.dart';
class Apitest extends StatefulWidget {
  const Apitest({super.key});

  @override
  State<Apitest> createState() => _ApitestState();
}

class _ApitestState extends State<Apitest> {
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    todoController.fetchTodos();
  }

  void _showAddTodoDialog() {
    Get.defaultDialog(
      title: 'Add Todo',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: userIdController,
            decoration: const InputDecoration(
              labelText: 'user Id',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final title = titleController.text.trim();
              final userId = userIdController.text.trim();
              if (title.isNotEmpty) {
                var data = {"todo": title, "userId": int.tryParse(userId)};
                await todoController.createTodo(data);
                Get.back(); // close dialog
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showUpdateTodoDialog(String title, String userid, String todoid) {
    final TextEditingController updatetitleController = TextEditingController(
      text: title,
    );
    final TextEditingController updateuserIdController = TextEditingController(
      text: userid,
    );

    Get.defaultDialog(
      title: 'Update Todo',
      content: Column(
        children: [
          TextField(
            controller: updatetitleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: updateuserIdController,
            decoration: const InputDecoration(
              labelText: 'user Id',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final title = updatetitleController.text.trim();
              final userId = updateuserIdController.text.trim();
              if (title.isNotEmpty) {
                var data = {"todo": title, "userId": int.tryParse(userId)};
                await todoController.updateTodo(todoid, data);
                Get.back(); // close dialog
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Testing")),

      body: Obx(() {
        if (todoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (todoController.error.isNotEmpty) {
          return Center(child: Text('Error: ${todoController.error}'));
        }

        if (todoController.todos.isEmpty) {
          return const Center(child: Text('No todos found.'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: todoController.todos.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final data = todoController.todos[index];
            return ListTile(
              title: Text(data.todo ?? 'No Title'),
              subtitle: Text('ID: ${data.id}'),
              contentPadding: EdgeInsets.all(8),
              trailing: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed:
                          () => _showUpdateTodoDialog(
                            data.todo,
                            data.userId.toString(),
                            data.id.toString(),
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Confirm Delete',
                          middleText:
                              'Are you sure you want to delete this todo?',
                          textConfirm: 'Yes',
                          textCancel: 'No',
                          confirmTextColor: Colors.white,
                          onConfirm: () async {
                            await todoController.deleteTodo(data.id);
                            Get.back();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}