import 'package:flutter/material.dart';
import 'package:flutter_sqflite_provider/Json/todo.dart';
import 'package:flutter_sqflite_provider/Provider/provider_db.dart';
import 'package:provider/provider.dart';

class UpdateTodo extends StatelessWidget {
  final Todo? todo;
  const UpdateTodo({super.key, this.todo});

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final content = TextEditingController();
    final notifier = Provider.of<ProviderDB>(context, listen: false);

    title.text = todo?.title ?? "";
    content.text = todo?.content ?? "";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Edit Barang"), // Mengubah judul AppBar menjadi "Edit Todo"
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close), // Tombol close (cancel)
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => notifier
                  .updateTodo(
                    Todo(
                      todoId: todo?.todoId,
                      title: title.text,
                      content: content.text,
                      isCompleted: false,
                    ),
                  )
                  .whenComplete(() => Navigator.pop(context)),
              icon: const Icon(Icons.check),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TextFormField(
                controller: title,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                controller: content,
                decoration: const InputDecoration(
                  hintText: "Content",
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
