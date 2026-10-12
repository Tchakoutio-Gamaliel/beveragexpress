import 'package:flutter/material.dart';

class MyordersPage extends StatefulWidget {
  const MyordersPage({super.key});

  @override
  State<MyordersPage> createState() => _MyordersPageState();
}

class _MyordersPageState extends State<MyordersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 4, 129),
        title: const Text('My Orders'),
      ),
    );
  }
}