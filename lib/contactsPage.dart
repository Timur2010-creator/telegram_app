import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Контакты')),
      body: Center(
        child: Text('Список контактов', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}