import 'package:flutter/material.dart';
import 'package:flutter_sqflite_provider/Json/todo.dart';
import 'package:flutter_sqflite_provider/Provider/provider_db.dart';
import 'package:flutter_sqflite_provider/TodoView/add_todo.dart';
import 'package:flutter_sqflite_provider/TodoView/todo_update.dart';
import 'package:provider/provider.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderDB>(
      builder: (context, notifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("List Stock"),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTodo()),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: notifier.todo.isEmpty
              ? const Center(child: Text("No todos available"))
              : ListView.builder(
                  itemCount: notifier.todo.length,
                  itemBuilder: (context, index) {
                    Todo todo = notifier.todo[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: ListTile(
                        title: Text(todo.title),
                        subtitle: Text('Stock: ${todo.content}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateTodo(
                                      todo: todo,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            IconButton(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Delete '${todo.title}'?"),
                                  content: Text(
                                    "Are you sure you want to delete this item?",
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        notifier.deleteTodo(todo.todoId!);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ],
                                ),
                              ),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
