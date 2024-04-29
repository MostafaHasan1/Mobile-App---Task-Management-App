import 'package:flutter/material.dart';
import 'package:login_page_setup/services/firestore_service.dart';


class AddTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Task")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            ElevatedButton(
              onPressed: () {
                final title = _controller.text;
                _firestoreService.addTask(title);
                Navigator.pop(context);
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
