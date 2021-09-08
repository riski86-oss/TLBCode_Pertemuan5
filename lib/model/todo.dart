import 'package:firebase_database/firebase_database.dart';

class Todo{
  String? key;
  String title;
  bool completed;
  String userId;

  Todo(this.title, this.completed, this.userId);

  Todo.formSnapshot(DataSnapshot snapshot):
    key = snapshot.key!,
    title = snapshot.value["title"],
    completed = snapshot.value["completed"],
    userId = snapshot.value["userId"];

  toJson(){
    return{
      "userId": userId,
      "title" : title,
      "completed" : completed
    };
  }
}