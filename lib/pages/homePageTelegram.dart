import 'package:flutter/material.dart';
import 'package:flutter_lesson6_meder_group/apps/appDrawer.dart';

class HomePageTelegram extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePageTelegram({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Telegram')), // Верхняя панель приложения с заголовком
      drawer: AppDrawer( // Боковое меню, которое получает состояние темы и обработчик смены темы
        isDarkMode: isDarkMode, 
        onThemeChanged: onThemeChanged,
      ),
      body: Padding( // Основной контент страницы с отступами по краям
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center( // Центрируем содержимое по экрану
          child: Text(
            'Нажмите на кнопку в левом верхнем углу, чтобы открыть раздел экранов',
            textAlign: TextAlign.center, // Выравнивание текста по центру
            style: const TextStyle(fontSize: 22), // Размер текста
          ),
        ),
      ),
    );
  }
}