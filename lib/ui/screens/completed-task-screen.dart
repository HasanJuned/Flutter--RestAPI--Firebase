import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../widgets/task-list-item.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: Expanded(
          child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                return TaskListItem(
                  subject: 'Subject',
                  description: 'kjfkjref',
                  date: '22/22/22',
                  type: 'Completed',
                  onEdit: () {},
                  onDelete: () {},
                );
              })),
    );
  }
}
