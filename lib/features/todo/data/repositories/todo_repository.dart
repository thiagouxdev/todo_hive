import 'package:hive/hive.dart';

import '../models/todo_model.dart';

class TodoRepository {
  final Box<TodoModel> _todoBox = Hive.box('todoBox');

  // Adicionar um novo Todo
  Future<void> addTodo(TodoModel todo) async {
    await _todoBox.put(todo.id, todo);
  }

  // Remover um Todo
  Future<void> removeTodo(String id) async {
    await _todoBox.delete(id);
  }

  // Atualizar um Todo
  Future<void> updateTodo(TodoModel todo) async {
    await _todoBox.put(todo.id, todo);
  }

  // Obter todos os Todos
  List<TodoModel> getAllTodos() {
    return _todoBox.values.toList();
  }
}
