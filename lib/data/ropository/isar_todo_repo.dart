/*
Database repo

this implement the todo repo and handles storing,
retrieving, updating, deleting data from the database

*/

import 'package:isar/isar.dart';
import 'package:todo_app_clean_architecture/data/models/isar_todo.dart';
import 'package:todo_app_clean_architecture/domain/models/todo.dart';
import 'package:todo_app_clean_architecture/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepository{

  //database
  final Isar db;
  IsarTodoRepo(this.db);

  //get todos
  @override
  Future<List<Todo>> getTodos() async {
    //fetch todos from the db
    final todos = await db.todoIsars.where().findAll();
    //return as a list of todo and give to domain layer
    return todos.map((e) => e.toDomain()).toList();
  }

  //add todo
  @override
  Future<void> addTodo(Todo newTodo) async {
    //convert todo to isar object
    final todoIsar = TodoIsar.fromDomain(newTodo);

    //so that we can store it in our isar db
    return db.writeTxn(()=>db.todoIsars.put(todoIsar));
  }


  //uodate todo
  @override
  Future<void> updateTodo(Todo todo) async {
    //convert todo to isar object
    final isarTodo = TodoIsar.fromDomain(todo);

    //so that we can store it in our isar db
    return db.writeTxn(()=>db.todoIsars.put(isarTodo));
  }

  //delete todo
  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(()=>db.todoIsars.delete(todo.id));
  }


}