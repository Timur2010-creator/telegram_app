import 'package:flutter/material.dart';
import 'package:flutter_lesson6_meder_group/homePageTelegram.dart';
import 'package:flutter_lesson6_meder_group/themeApp.dart';

class TelegramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorSchemeSeed: Color(0xFF2AABEE),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      home: HomePageTelegram()
    );
  }
}