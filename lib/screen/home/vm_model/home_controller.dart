

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/todo_model.dart';


final homeController = Get.put(HomeController());

class HomeController extends GetxController{
  List<TodoModel> todoList = [];

  void createTodo({
    required TodoModel todo,
  }){
    try{
      todoList.add(todo);
     update();
    }catch(e){
      debugPrint(e.toString());
    }
  }

  void updateTodo({required TodoModel todo}){
    todoList.removeWhere((data) => data.id == todo.id);
    todoList.add(todo);
    update();
  }

  void deleteTodo({required TodoModel todo}){
    todoList.remove(todo);
    update();
  }

}
