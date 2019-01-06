import 'package:flutter/material.dart';
import 'package:fuel_app/utils/dbhelper.dart';
import 'package:fuel_app/model/todo.dart';
import 'package:fuel_app/Screens/todoList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Todo> todos = List<Todo>();
    DbHelper helper = DbHelper();
    helper.initializeDb().then(
      (result) => helper.getTodos().then((result)=> todos=result)
    );
    // DateTime today = DateTime.now();
    // Todo todo = Todo("Buy Mangos", 1, today.toString(), "And make sure they are good");
    // helper.insertTodo(todo);

    return new MaterialApp(
      title: "Todos",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter todo app',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: TodoList(),
    );
  }
}