import 'package:flutter/material.dart';

class MyaddressesPage extends StatefulWidget {
  const MyaddressesPage({super.key});

  @override
  State<MyaddressesPage> createState() => _MyaddressesPageState();
}

class _MyaddressesPageState extends State<MyaddressesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 4, 129),
        title: const Text('My Addresses'),
      ),
    );
  }
}