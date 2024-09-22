import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageController()..init(),
      child: _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Logger().wtf('buildbuildbuildbuildbuildbuildbuildbuild');
    return Consumer<HomePageController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                  size: 24,
                )),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.blueGrey.shade200,
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (context, index) {
                var todo = controller.todos[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: controller.getColorFromPriority(todo.priority),
                  ),
                  child: ListTile(
                    title: Text(todo.task ?? 'Data is empty'),
                    subtitle: Text(todo.description ?? 'Data is empty'),
                    trailing: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {},
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey.shade200,
            onPressed: () {
              Navigator.pushNamed(context, '/addTask');
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
