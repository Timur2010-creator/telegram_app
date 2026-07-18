import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Чаты')),
      body: Center(
        child: Text('Чаты', style: TextStyle(fontSize: 20))),
    );
  }
}
