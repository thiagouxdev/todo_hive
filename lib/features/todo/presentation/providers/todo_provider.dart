import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_hive/features/todo/data/models/todo_model.dart';
import '../../data/repositories/todo_repository.dart';

// Provider do repositório
final todoRepositorProvider = Provider<TodoRepository>((ref) {
  return TodoRepository();
});

class TodoListNotifier extends StateNotifier<AsyncValue<List<TodoModel>>> {
  final TodoRepository _repository;

  TodoListNotifier(this._repository) : super(const AsyncValue.loading()) {
    _loadTodos(); // Carrega as tarefas ao inicializar
  }

  // Carrega as tarefas
  Future<void> _loadTodos() async {
    state = const AsyncValue.loading(); // Define o estado como loading
    try {
      final todos = _repository.getAllTodos();
      state = AsyncValue.data(todos); // Define o estado com os dados
    } catch (e) {
      state =
          AsyncValue.error(e, StackTrace.current); // Define o estado de erro
    }
  }

  // Adicionar um novo Todo
  Future<void> addTodo(String title) async {
    final todo = TodoModel(
      id: DateTime.now().toString(),
      title: title,
    );
    await _repository.addTodo(todo);
    await _loadTodos(); // Recarrega as tarefas após adicionar
  }

  // Alternar o estado de um Todo
  Future<void> toggleTodoCompletion(TodoModel todo) async {
    todo.isCompleted = !todo.isCompleted;
    await _repository.updateTodo(todo);
    await _loadTodos();
  }

  // Remover um Todo
  Future<void> removeTodo(String id) async {
    await _repository.removeTodo(id);
    await _loadTodos();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, AsyncValue<List<TodoModel>>>(
  (ref) {
    return TodoListNotifier(ref.read(todoRepositorProvider));
  },
);
