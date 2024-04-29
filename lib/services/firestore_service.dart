import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTask(String title) async {
    await _db.collection('tasks').add({'title': title, 'isDone': false});
  }

  Stream<List<Task>> getTasks() {
    return _db.collection('tasks').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
    });
  }

  Future<void> updateTask(String id, bool isDone) async {
    await _db.collection('tasks').doc(id).update({'isDone': isDone});
  }

  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }
}

