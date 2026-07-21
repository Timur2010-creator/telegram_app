import 'package:flutter/material.dart'; 

class HelpPage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) { // создание интерфейса страницы
    final telegramBlue = const Color(0xFF2AABEE); // цвет Telegram

    return Scaffold( // основной контейнер страницы
      appBar: AppBar( // верхняя панель
        title: const Text('Поддержка Telegram'), 
        backgroundColor: telegramBlue, // цвет панели
        foregroundColor: Colors.white, // цвет текста
        centerTitle: true, 
        elevation: 0, // без тени
      ),
      body: Padding( // отступы внутри контента
        padding: const EdgeInsets.all(16), // общий отступ
        child: Column( // вертикальный блок (сверху вниз)
          crossAxisAlignment: CrossAxisAlignment.start, // выравнивание влево
          children: [ // если несколько элементы колонок
            const Text(
              'Нужна помощь?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12), 
            
            const Text(
              'Напишите нам и мы помогли решить проблему быстро и удобно.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ), 

            const SizedBox(height: 24), 

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.email_outlined, color: Color(0xFF2AABEE)),
                title: const Text('Email support'),
                subtitle: const Text('support@telegramapp.com'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ), 
            
            const SizedBox(height: 12), 

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                leading: const Icon(Icons.phone_outlined, color: Color(0xFF2AABEE)),
                title: const Text('Телефон'),
                subtitle: const Text('+996 700 112 355'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
