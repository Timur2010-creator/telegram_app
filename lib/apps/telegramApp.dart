import 'package:flutter/material.dart';
import 'package:flutter_lesson6_meder_group/pages/homePageTelegram.dart';

class TelegramApp extends StatefulWidget {
  @override
  State<TelegramApp> createState() => _TelegramAppState();
}

class _TelegramAppState extends State<TelegramApp> {
  // По умолчанию ставим светлую тему
  ThemeMode _themeMode = ThemeMode.light;

  // Функция для переключения темы
  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram App',
      themeMode: _themeMode, // Передаем текущую тему сюда
      
      // Настройки светлой темы
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorSchemeSeed: Color(0xFF2AABEE),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
      ),
      
      // Настройки темной темы
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade900,
        colorSchemeSeed: Color(0xFF2AABEE),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.grey.shade900,
        ),
      ),
      
      // Передаем состояние темы и функцию управления в главный экран
      home: HomePageTelegram(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}