import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                onPressed: () => Navigator.pop(context),
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
            onPressed:()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage())),
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