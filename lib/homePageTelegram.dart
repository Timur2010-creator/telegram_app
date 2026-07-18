import 'package:flutter/material.dart';
import 'package:flutter_lesson6_meder_group/appDrawer.dart';

class HomePageTelegram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Telegram')),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Chat', 
        style: TextStyle(
          fontSize: 22),
        ),
      ),
    );
  }
}
