import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Настройки')),
      body: Center(
        child: Text('Настройки', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}