import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Поддержка Telegram')),
      body: Center(
        child: Text('Поддержка', style: TextStyle(fontSize: 20))),
    );
  }
}
