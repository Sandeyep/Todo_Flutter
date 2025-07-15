import 'package:get/get.dart';
import 'package:todo_app/api%20test/respository/api_repository.dart';

import '../model/test_model.dart';

class TodoController extends GetxController {
  final ApiRepository _apiRepository = ApiRepository();

  var todos = <Todo>[].obs;
  var isLoading = false.obs;
  var error = ''.obs;

  Future<void> fetchTodos() async {
    try {
      isLoading.value = true;
      error.value = '';
      final result = await _apiRepository.getTodos();
      todos.assignAll(result);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<Todo?> getTodoById(String id) async {
    try {
      isLoading.value = true;
      final todo = await _apiRepository.getTodoById(id);
      return todo;
    } catch (e) {
      error.value = e.toString();
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createTodo(Map<String, dynamic> data) async {
    try {
      isLoading.value = true;
      final newTodo = await _apiRepository.createTodo(data);
      todos.add(newTodo);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateTodo(String id, Map<String, dynamic> updateData) async {
    try {
      isLoading.value = true;
      final updatedTodo = await _apiRepository.updateTodo(id, updateData);

      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        todos[index] = updatedTodo;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      isLoading.value = true;
      await _apiRepository.deleteTodo(id);
      todos.removeWhere((todo) => todo.id == id);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
