import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_hive/app/my_app.dart';

import '../features/todo/data/models/todo_model.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  await SharedPreferences.getInstance();

  await Hive.initFlutter(); // Inicializa o Hive
  Hive.registerAdapter(TodoModelAdapter()); // Registra o adaptador do modelo
  await Hive.openBox<TodoModel>(
      'todoBox'); // Abre a Box para armazenar as tarefas

  // Run the app with ProviderScope
  runApp(const ProviderScope(child: MyApp()));
}
