import 'package:flutter/material.dart';
import 'package:softbyhasan/data/models/task-model.dart';
import 'package:softbyhasan/data/network-utils.dart';
import 'package:softbyhasan/ui/screens/add-new-task-screen.dart';
import 'package:softbyhasan/ui/utils/snackbar-message.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../../data/urls.dart';
import '../widgets/app-elevated-button.dart';
import '../widgets/changeTaskStatus-show-bottom-sheet.dart';
import '../widgets/dashboard.dart';
import '../widgets/task-list-item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  TaskModel newTaskModel = TaskModel();
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getNewTasks();
  }

  Future<void> getNewTasks() async {
    inProgress = true;
    setState(() {});
    final response = await NetworkUtils().getMethod('https://task.teamrabbil.com/api/v1/listTaskByStatus/New');

    if (response != null) {
      newTaskModel = TaskModel.fromJson(response);
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
              Row(
                children: const [
                  Expanded(
                    child: DashboardItem(
                      typeOfTask: 'New',
                      numberOfTask: 20,
                    ),
                  ),
                  Expanded(
                    child: DashboardItem(
                      typeOfTask: 'Completed',
                      numberOfTask: 20,
                    ),
                  ),
                  Expanded(
                    child: DashboardItem(
                      typeOfTask: 'Cancelled',
                      numberOfTask: 20,
                    ),
                  ),
                  Expanded(
                    child: DashboardItem(
                      typeOfTask: 'In Progress',
                      numberOfTask: 20,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: inProgress
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            getNewTasks();
                          },
                          child: ListView.builder(
                              itemCount: newTaskModel.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                return TaskListItem(
                                  subject: newTaskModel.data?[index].title ??
                                      'Unknown',
                                  description:
                                      newTaskModel.data?[index].description ??
                                          'Unknown',
                                  date: newTaskModel.data?[index].createdDate ??
                                      'Unknown',
                                  type: 'New',
                                  backgroundColor: Colors.lightBlueAccent,
                                  onEdit: () {
                                    showChangedTaskStatus('New',newTaskModel.data?[index].sId ?? '',(){
                                      getNewTasks();
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

}
