import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _auth = FirebaseAuth.instance;
  final _databaseRef = FirebaseDatabase.instance.reference();

  late StreamSubscription<Event> _onTodoAddedSubscription;
  late StreamSubscription<Event> _onTodoChangedSubscription;
  late Query _todoQuery;
  List<Todo> _todoList = [];
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    _todoQuery = _databaseRef.child("todo").orderByChild("userId").equalTo("mgknHmsPBIM05nP15swOGIzBRSZ2");
    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription = _todoQuery.onChildChanged.listen(onEntryChanged);
    super.initState();
  }

  @override
  void dispose() {
    _onTodoChangedSubscription.cancel();
    _onTodoAddedSubscription.cancel();
    super.dispose();
  }

  onEntryAdded(Event event){
    setState(() {
      _todoList.add(Todo.formSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event){
    var oldEntry = _todoList.singleWhere((element){
      return element.key == event.snapshot.key;
    });
    setState(() {
      _todoList[_todoList.indexOf(oldEntry)] = Todo.formSnapshot(event.snapshot);
    });
  }

  _create(String title){
    Todo todo = Todo(title, false, "mgknHmsPBIM05nP15swOGIzBRSZ2");
    _databaseRef.child("todo").push().set("chairuman");
    debugPrint(todo.title);
  }

  _update(Todo todo){
    todo.completed = !todo.completed;
    if(todo != null){
      _databaseRef.child("todo").child(todo.key.toString()).set(todo.toJson());
    }
  }

  _delete(String key, int index){
    _databaseRef.child("todo").child(key).remove().then((_){
      setState(() {
        _todoList.removeAt(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    

    _showDialog(BuildContext context) async{
      await showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            content: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Tambah todo'
                    )
                  ),
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal")),
                TextButton(
                onPressed: (){
                  _create(_titleController.text);
                  Navigator.pop(context);
                },
                child: const Text("Simpan"))
            ],
          );
        }
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Todo App"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed:(){
              _auth.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: const Text("keluar", style: TextStyle(color:Colors.white, fontSize: 16),))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialog(context);
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key("key"),
            background: Container(color: Colors.red),
            onDismissed: (direction){},
            child: ListTile(
              title: Text("Todo $index", style: TextStyle(fontSize: 17.0)),
              trailing: IconButton(
                icon: const Icon(Icons.done_outline, color: Colors.green, size: 17.0),
                onPressed: (){},
              )
            ),
          );
        },
        itemCount: 15,
      ),
    );
  }
}