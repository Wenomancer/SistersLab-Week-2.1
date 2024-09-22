import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisterslabsecond/add_task/presentation/add_task_page_controller.dart';
import 'package:sisterslabsecond/general/data/model/todo_model.dart';
import 'package:sisterslabsecond/general/utils/app_utils.dart';

import '../../home/presentation/home_page_controller.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddTaskPageController(),
      child: _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  TextEditingController taskController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AddTaskPageController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey.shade200,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            )),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: taskController,
              decoration: const InputDecoration(labelText: 'Task'),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your task';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Is Done', style: TextStyle(fontSize: 16)),
                Checkbox(
                  value: controller.isDone,
                  onChanged: (value) {
                    controller.isDoneChanged(value);
                  },
                ),
              ],
            ),
            const Divider(
              height: 16,
              color: Colors.blueGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Priority', style: TextStyle(fontSize: 16)),
                DropdownButton(
                  value: controller.priority,
                  items: [
                    DropdownMenuItem(
                      value: PriorityEnum.LOW.index,
                      child: Text(PriorityEnum.LOW.name),
                    ),
                    DropdownMenuItem(
                      value: PriorityEnum.MEDIUM.index,
                      child: Text(PriorityEnum.MEDIUM.name),
                    ),
                    DropdownMenuItem(
                      value: PriorityEnum.HIGH.index,
                      child: Text(PriorityEnum.HIGH.name),
                    ),
                    DropdownMenuItem(
                      value: PriorityEnum.CRITICAL.index,
                      child: Text(PriorityEnum.CRITICAL.name),
                    ),
                    DropdownMenuItem(
                      value: PriorityEnum.DEADLY.index,
                      child: Text(PriorityEnum.DEADLY.name),
                    ),
                  ],
                  onChanged: (value) {
                    controller.priorityChanged(value);
                  },
                ),
              ],
            ),
            const Divider(
              height: 16,
              color: Colors.blueGrey,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.blueGrey.shade200),
                ),
                onPressed: () {
                  controller.addTodo(TodoModel(
                    task: taskController.text,
                    description: descriptionController.text,
                    isDone: controller.isDone,
                    priority: controller.priority,
                  ));
                  Navigator.pop(context);
                },
                child: const Text('Add Task'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
