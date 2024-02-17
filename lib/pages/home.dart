import 'package:first_project/pages/book.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Book()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'Library Management',
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        centerTitle: true,
      ),
       body: Container(
          child: Column(
        children: [],
      )),
    );
  }
}
