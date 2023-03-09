import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../../data/models/task-model.dart';
import '../../data/network-utils.dart';
import '../utils/snackbar-message.dart';
import '../widgets/task-list-item.dart';
import 'add-new-task-screen.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  TaskModel completedTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    completedNewTasks();
  }

  Future<void> completedNewTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils()
        .getMethod('https://task.teamrabbil.com/api/v1/listTaskByStatus/Completed');

    if (response != null) {
      completedTaskModel = TaskModel.fromJson(response);
    } else {
      showSnackBarMessage(context, 'Unable to fetch data. Try again!', true);
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Column(
            children: [
              Expanded(
                  child: inProgress
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            completedNewTasks();
                          },
                          child: ListView.builder(
                              itemCount: completedTaskModel.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return TaskListItem(
                                  subject: completedTaskModel.data?[index].title ??
                                      'Unknown',
                                  description:
                                      completedTaskModel.data?[index].description ??
                                          'Unknown',
                                  date: completedTaskModel.data?[index].createdDate ??
                                      'Unknown',
                                  type: 'Completed',
                                  backgroundColor: Colors.lightBlueAccent,
                                  onEdit: () {},
                                  onDelete: () {},
                                );
                              }),
                        )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewTaskScreen()));
        },
      ),
    );
  }
}
