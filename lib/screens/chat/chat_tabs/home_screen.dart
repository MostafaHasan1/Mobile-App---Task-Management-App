import 'package:flutter/material.dart';
import 'package:login_page_setup/models/task.dart';
import 'package:login_page_setup/services/firestore_service.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final FirestoreService _firestoreService = FirestoreService();
    return Scaffold(
      body: StreamBuilder<List<Task>>(
        stream: _firestoreService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      title: Text(task.title,style: TextStyle(
                        decoration: task.isDone ? TextDecoration.lineThrough : null,
                      )),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: task.isDone,
                            onChanged: (bool? value) {
                              _firestoreService.updateTask(task.id, value ?? false);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _firestoreService.deleteTask(task.id);
                            },
                          ),
                        ],
                      ),
                      tileColor: Colors.orange.shade300,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
