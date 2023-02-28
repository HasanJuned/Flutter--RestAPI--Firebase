import 'package:flutter/material.dart';
class TaskListItem extends StatelessWidget {
  const TaskListItem({
    Key? key,
    required this.subject,
    required this.description,
    required this.date,
    required this.type,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  final String subject, description, date, type;
  final VoidCallback onEdit, onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(description),
            const SizedBox(
              height: 8,
            ),
            Text('Date : $date'),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Chip(
                  label: Text(type),
                  backgroundColor: Colors.blueAccent,
                ),
                const Spacer(),
                IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: onDelete, icon: Icon(Icons.delete_outline)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
