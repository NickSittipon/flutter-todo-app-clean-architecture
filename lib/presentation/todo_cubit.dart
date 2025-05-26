/*
TO DO CUBIT - simple state management

Each cubit is a list of todos.

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_clean_architecture/domain/models/todo.dart';
import 'package:todo_app_clean_architecture/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>>{
  //Reference to the todo repo
  final TodoRepo todoRepository;

  //constructor initializes the cubit with an empty list of todos
  TodoCubit(this.todoRepository) : super([]){
    //load todos from the repo
    loadTodos();
  }

  //load
  Future<void> loadTodos() async {
    //fetch list of todos from repo
    final todos = await todoRepository.getTodos();
    //emit the fetched list as the new state
    emit(todos);
  }

  //add todo

  Future<void> addTodo(String text) async {
    //create a new todo with unique id
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
      isCompleted: false,
    );
    //save the new todo to repo
    await todoRepository.addTodo(newTodo);

    //reload
    loadTodos();
  }

  //delete todo
  Future<void> deleteTodo(Todo todo) async {
    //delete the provider todo from repo
    await todoRepository.deleteTodo(todo);

    //reload 
    loadTodos();
  }

  //toggle
  Future<void> toggleCompletion(Todo todo) async {
    //toggle the completion status of provider todo
    final updatedTodo = todo.toggleCompletion();

    //update the todo in repo with new completion status
    await todoRepository.updateTodo(updatedTodo);

    //reload
    loadTodos();
  }
  
}