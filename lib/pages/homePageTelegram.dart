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
      appBar: AppBar( 
        title: Text('Telegram', style: TextStyle(color: Colors.white),),
        centerTitle: true, 
        flexibleSpace: Container( // Контейнер для градиента
            decoration: const BoxDecoration( // Оформление контейнера
              gradient: LinearGradient( // Линейный градиент
                begin: Alignment.topLeft,   // Откуда начинается перелив
                end: Alignment.bottomRight, // Где заканчивается перелив
                colors: [ // Цвета градиента
                  Color(0xFF0A1128), // Темно-синий неоновый (под тон экрана)
                  Color(0xFF1B0933), // Переход в неоновый фиолетовый
                  Color(0xFF3A0066), // Глубокий светящийся фиолетовый в конце
                ],
              ),
            ),
          ),
        backgroundColor: Colors.transparent, // Делаем фон AppBar прозрачным чтобы увидеть градиент
        elevation: 0, //  убираем тень 
        iconTheme: const IconThemeData(color: Colors.white), 
      ),
      drawer: AppDrawer( // Боковое меню которое получает состояние темы и обработчик смены темы
        isDarkMode: isDarkMode, 
        onThemeChanged: onThemeChanged,
      ),
      body: Padding( // Основной контент страницы с отступами по краям
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Center( // Центрируем содержимое по экрану
          child: Text(
            'Нажмите на кнопку в левом верхнем углу, чтобы открыть раздел экранов',
            textAlign: TextAlign.center, // Выравнивание текста по центру
            style: const TextStyle(fontSize: 22), 
          ),
        ),
      ),
    );
  }
}