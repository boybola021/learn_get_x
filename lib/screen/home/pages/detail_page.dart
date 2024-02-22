import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_get_x/screen/home/vm_model/home_controller.dart';
import '../../../model/todo_model.dart';

class DetailPage extends StatelessWidget {
  final TodoModel? todo;

  const DetailPage({super.key, this.todo});

  static TextEditingController controllerTitle = TextEditingController();
  static TextEditingController controllerDesc = TextEditingController();

  void createAndEditTodo(BuildContext context) {
    String title = controllerTitle.text;
    String desc = controllerDesc.text;
    if (title.isEmpty || desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Title or description field empty"),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (todo == null) {
    TodoModel newData = TodoModel(
        id: Random().nextInt(100).toString(),
        title: title,
        description: desc,
        isCompleted: false);
    Get.find<HomeController>().createTodo(todo: newData);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Successful create todo"),
        backgroundColor: Colors.green,
      ),
    );
    Get.back();
    } else {
      TodoModel editData = TodoModel(
          id: todo!.id,
          title: title,
          description: desc,
          isCompleted: todo!.isCompleted);
      Get.find<HomeController>().updateTodo(todo: editData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successful edit todo"),
          backgroundColor: Colors.green,
        ),
      );
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    controllerTitle.text = todo?.title ?? "";
    controllerDesc.text = todo?.description ?? "";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          todo != null ? "Create Todo" : "Edit Todo",
          style: const TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () => createAndEditTodo(context),
            icon: const Icon(Icons.save),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerTitle,
              decoration: const InputDecoration(),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerDesc,
              decoration: const InputDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
