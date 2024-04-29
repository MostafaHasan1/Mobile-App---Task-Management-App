import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String title;
  bool isDone;

  Task({required this.id, required this.title, this.isDone = false});

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Task(
      id: doc.id,
      title: data['title'],
      isDone: data['isDone'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }
}
