import 'package:flutter/material.dart';

import '../widgets/screen-Background-images.dart';
import '../widgets/task-list-item.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({Key? key}) : super(key: key);

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
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
                  type: 'Cancelled',
                  onEdit: () {},
                  onDelete: () {},
                );
              })),
    );
  }
}
