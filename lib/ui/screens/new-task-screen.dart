import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../widgets/dashboard.dart';
import '../widgets/task-list-item.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
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
          Expanded(child: ListView.builder(
            itemCount: 12,
              itemBuilder: (context, index) {
            return TaskListItem(
              subject: 'Subject',
              description: 'kjfkjref',
              date: '22/22/22',
              type: 'new',
              onEdit: () {},
              onDelete: () {},
            );
          })),
        ],
      ),
    );
  }
}