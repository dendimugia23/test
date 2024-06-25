import 'package:flutter/material.dart';
import 'package:flutter_sqflite_provider/Json/todo.dart';
import 'package:flutter_sqflite_provider/Provider/provider_db.dart';
import 'package:flutter_sqflite_provider/TodoView/todo_view.dart'; // Pastikan import benar
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Barang'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Provider.of<ProviderDB>(context, listen: false).fetchTodo();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Stock'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<ProviderDB>(
        builder: (context, provider, _) {
          if (provider.todo.isEmpty) {
            return Center(
              child: Text("No todos available"),
            );
          } else {
            return ListView.builder(
              itemCount: provider.todo.length,
              itemBuilder: (context, index) {
                Todo todo = provider.todo[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text('Stock: ${todo.content}'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
