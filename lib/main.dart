import 'package:flutter/material.dart';
import 'package:flutter_sqflite_provider/Provider/provider_db.dart';
import 'package:flutter_sqflite_provider/TodoView/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderDB()..init(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          // You can customize other theme attributes here if needed
        ),
        home: Home(),
      ),
    );
  }
}
