import 'package:flutter/material.dart';
import 'package:flutter_sqflite_provider/Json/todo.dart';
import 'package:flutter_sqflite_provider/Provider/provider_db.dart';
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final barangController = TextEditingController();
    final stockController = TextEditingController();
    final notifier = Provider.of<ProviderDB>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Tambah Barang"), // Mengubah judul AppBar menjadi "Add New Item"
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close), // Tombol close (cancel)
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => notifier
                  .insertTodo(
                    Todo(
                      title: barangController.text,
                      content: stockController.text,
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
                controller: barangController,
                decoration: const InputDecoration(
                  hintText:
                      "Nama Barang", // Mengubah hint untuk input nama barang
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                controller: stockController,
                keyboardType: TextInputType
                    .number, // Keyboard type untuk input jumlah stock
                decoration: const InputDecoration(
                  hintText:
                      "Jumlah Stock", // Mengubah hint untuk input jumlah stock
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
