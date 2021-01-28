import 'package:flutter/material.dart';
import 'package:todolist/model/Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15,
                          right: 15
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.menu, size: 30,),
                          Expanded(
                            child: Text(
                              'All Tasks',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TodoList(),
                    Text('OK')
                  ],
                )
            ),
          )
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  TodoList({Key key}): super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [
    Todo(1, '_name', false),
  ];

  void _createTodo(String name) {
    setState(() {
      int id = todos.length + 1;
      Todo todo = new Todo(id, name, false);
      todos.add(todo);
    });
  }

  void _updateTodo(int id) {
    int index = todos.indexWhere((element) => element.id == id);

    setState(() {
      if(index >= 0) {
        todos[index].isDone = !todos[index].isDone;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /*return Padding(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return buildTask(index);
        },
      ),
//      child: Column(
//        children: [
//
//        ],
//      ),
    );
    */
//    todos.asMap().map((key, value) => buildTask(key));
//
  print(todos);
    return Container(
      child: Column(
        children: List.generate(todos.length, (i) => buildTask(i)),
      ),
    );
  }

  Widget buildTask(int index) {
//    Todo task = todos[index];
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        height: 35,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20
                ),
                child: Text(
                  'task.name',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Icon(// check_circle_outline
                  1 == 1 ? Icons.check_circle_outline : Icons.radio_button_unchecked_outlined,
                  size: 30,
                  color: Colors.blue,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }


}
