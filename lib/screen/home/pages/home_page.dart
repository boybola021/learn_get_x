import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_get_x/screen/home/pages/detail_page.dart';
import 'package:learn_get_x/screen/home/vm_model/home_controller.dart';
import '../vm_model/getX_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static LocalizationGetXController languageController =
      LocalizationGetXController();

  static int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "todo".tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          PopupMenuButton<Widget>(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            icon: const Icon(Icons.language,size: 25,),
            itemBuilder: (context) {
              return [
                for (int i = 0; i < CategoryEnum.values.length; i++)
                  PopupMenuItem(
                    child: Text(CategoryEnum.values[i].text),
                    onTap: () {
                      index = i;
                      if (index == 0) {
                        languageController.changeLanguage("en", "US");
                      } else if (index == 1) {
                        languageController.changeLanguage("ru", "RU");
                      } else if (index == 2) {
                        languageController.changeLanguage("uz", "UZ");
                      }
                    },
                  ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const DetailPage()),
        child: const Icon(
          Icons.add,
          size: 23,
        ),
      ),
      body: GetBuilder<HomeController>(
        initState: (value) => homeController.todoList,
        init: HomeController(),
        builder: (HomeController controller) {
          if (controller.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: controller.todoList.length,
              itemBuilder: (context, i) {
                final data = controller.todoList[i];
                return Card(
                  child: ListTile(
                    onTap: () => Get.to(
                      DetailPage(
                        todo: data,
                      ),
                    ),
                    leading: Text(
                      data.id,
                      style: const TextStyle(fontSize: 20),
                    ),
                    title: Text(
                      data.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      data.description,
                      style: const TextStyle(fontSize: 18),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.deleteTodo(todo: data);
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        size: 25,
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "No Data",
                style: TextStyle(fontSize: 30),
              ),
            );
          }
        },
      ),
    );
  }
}

