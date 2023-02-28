import 'package:flutter/material.dart';

import '../widgets/screen-Background-images.dart';
import '../widgets/task-list-item.dart';

class InprogressTaskScreen extends StatefulWidget {
  const InprogressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InprogressTaskScreen> createState() => _InprogressTaskScreenState();
}

class _InprogressTaskScreenState extends State<InprogressTaskScreen> {
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
                  type: 'Progress',
                  backgroundColor: Colors.purple,
                  onEdit: () {},
                  onDelete: () {},
                );
              })),
    );
  }
}
