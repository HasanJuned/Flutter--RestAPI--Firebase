import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../../data/models/task-model.dart';
import '../../data/network-utils.dart';
import '../../data/urls.dart';
import '../utils/snackbar-message.dart';
import '../widgets/app-elevated-button.dart';
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
    final response = await NetworkUtils().getMethod(
        'https://task.teamrabbil.com/api/v1/listTaskByStatus/Completed');

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
                                  subject:
                                      completedTaskModel.data?[index].title ??
                                          'Unknown',
                                  description: completedTaskModel
                                          .data?[index].description ??
                                      'Unknown',
                                  date: completedTaskModel
                                          .data?[index].createdDate ??
                                      'Unknown',
                                  type: 'Completed',
                                  backgroundColor: Colors.lightBlueAccent,
                                  onEdit: () {
                                    showChangedTaskStatus(
                                        'Completed',
                                        completedTaskModel.data?[index].sId ??
                                            '', () {
                                      completedNewTasks();
                                    });
                                  },
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

  showChangedTaskStatus(String currentStatus, String taskId, VoidCallback onChangeTaskStatus) {
    String statusValue = currentStatus;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, changeState) {
            return Column(
              children: [
                RadioListTile(
                    value: 'New',
                    title: const Text('New'),
                    groupValue: statusValue,
                    onChanged: (state) {
                      statusValue = state!;
                      changeState(() {});
                    }),
                RadioListTile(
                    value: 'Completed',
                    title: const Text('Completed'),
                    groupValue: statusValue,
                    onChanged: (state) {
                      statusValue = state!;
                      changeState(() {});
                    }),
                RadioListTile(
                    value: 'Cancelled',
                    title: const Text('Cancelled'),
                    groupValue: statusValue,
                    onChanged: (state) {
                      statusValue = state!;
                      changeState(() {});
                    }),
                RadioListTile(
                    value: 'Progress',
                    title: const Text('Progress'),
                    groupValue: statusValue,
                    onChanged: (state) {
                      statusValue = state!;
                      changeState(() {});
                    }),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppElevatedButton(
                      child: const Text('Change Status'),
                      ontap: () async {
                        final response = await NetworkUtils().getMethod(Urls.changeTaskStatus(taskId, statusValue));
                        if (response != null) {
                          onChangeTaskStatus();
                          Navigator.pop(context);
                        } else {
                          showSnackBarMessage(
                              context, 'Status change failed. Try again!', true);
                        }
                      }),
                )
              ],
            );
          });
        });
  }

}
