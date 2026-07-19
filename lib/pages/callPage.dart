import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key}); // Конструктор страницы звонков с ключом для виджета

  final List<Map<String, dynamic>> calls = const [ // Список данных для звонков
    {
      'name': 'Аня', // Имя контакта
      'image': 'https://avatars.mds.yandex.net/i?id=61978395458b43651421108a3a3b24af3d496c9a-12421685-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': '2m ago', // Когда был звонок
      'status': 'missed', // Пропущенный звонок
      'duration': '12 min', // Длительность звонка
    },
    {
      'name': 'Максим', // Имя контакта
      'image': 'https://avatars.mds.yandex.net/i?id=8fdc49a37ef477d27d66c47d1e81e6e28d9cd610-4365707-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': '1h ago', // Когда был звонок
      'status': 'answered', // Принятый звонок
      'duration': '25 min', // Длительность звонка
    },
    {
      'name': 'Бека', // Имя контакта
      'image': 'https://avatars.mds.yandex.net/i?id=e12172e531bbbf62209350215c93bd3dbd1b32e1-4565467-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': '2h ago', // Когда был звонок
      'status': 'missed', // Пропущенный звонок
      'duration': '3 min', // Длительность звонка
    },
    {
      'name': 'tttimur02', // Имя контакта
      'image': 'https://avatars.mds.yandex.net/i?id=1b9d292b10b26aef341487b345c545a825333292-13465740-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': '45m ago', // Когда был звонок
      'status': 'answered', // Принятый звонок
      'duration': '8 min', // Длительность звонка
    },
    {
      'name': 'Медер байке АВТОРИТЕТ', // Имя контакта
      'image': 'https://media.licdn.com/dms/image/v2/D4D22AQHABRiBQXzUPw/feedshare-shrink_800/B4DZR1Qp4qHEAo-/0/1737134096081?e=2147483647&v=beta&t=3lVfb2pmwxTnkSLc3bcaVgqIWxjzChNjzXidSudg_PQ', // Ссылка на аватарку
      'timeAgo': '3h ago', // Когда был звонок
      'status': 'missed', // Пропущенный звонок
      'duration': '1 min', // Длительность звонка
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Основной каркас страницы
      appBar: AppBar( // Верхняя панель приложения
        title: const Text('Звонки'), // Заголовок страницы
      ),
      body: ListView.builder( // Список для отображения звонков
        padding: const EdgeInsets.all(12), // Внутренние отступы списка
        itemCount: calls.length, // Количество элементов списка
        itemBuilder: (context, index) {
          final call = calls[index]; // Текущий звонок по индексу
          final isMissed = call['status'] == 'missed'; // Проверка пропущенного звонка

          return Padding( // Отступ между карточками
            padding: const EdgeInsets.only(bottom: 12), // Отступ снизу
            child: Container( // Карточка одного звонка
              padding: const EdgeInsets.all(12), // Внутренние отступы карточки
              decoration: BoxDecoration( // Декор карточки
                color: Colors.white, // Цвет фона карточки
                borderRadius: BorderRadius.circular(16), // Скругление углов
                boxShadow: [ // Тень карточки
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05), // Цвет тени
                    blurRadius: 6, // Размытие тени
                    offset: const Offset(0, 2), // Смещение тени
                  ),
                ],
              ),
              child: Row( // Расположение аватарки и текста в одну строку
                children: [
                  CircleAvatar( // Аватар контакта
                    radius: 24, // Размер аватарки
                    backgroundImage: NetworkImage(call['image']!), // Изображение из сети
                  ),

                  const SizedBox(width: 12), // Отступ между аватаркой и текстом
                  
                  Expanded( // Блок с именем и информацией о звонке
                    child: Column( // Вертикальное размещение текста
                      crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
                      children: [
                        Text( // Имя контакта
                          call['name']!, // Имя контакта
                          style: const TextStyle(
                            fontSize: 16, // Размер текста
                            fontWeight: FontWeight.bold, // Жирность текста
                            color: Colors.black87, // Цвет текста
                          ),
                        ),

                        const SizedBox(height: 4), // Отступ между именем и подстрокой
                        
                        Row( // Строка со временем, иконкой и статусом
                          children: [
                            Text( // Время после звонка
                              'Called you: ' + call['timeAgo']!, // Время после звонка
                              style: const TextStyle(
                                fontSize: 14, // Размер текста
                                color: Colors.black87, // Цвет текста
                              ),
                            ),

                            const SizedBox(width: 6), // Отступ между временем и иконкой

                            Icon( // Иконка звонка справа
                               isMissed ? Icons.call_missed : Icons.call_received, // Иконка по статусу
                               color: isMissed ? Colors.red : Colors.green, // Цвет иконки
                               size: 20, // Размер иконки
                            ),

                            const SizedBox(width: 4), // Отступ между иконкой и текстом

                            Text( // Информация о звонке
                              '${isMissed ? 'Missed call' : 'Accepted call'} • ${call['duration']}', // Текст о звонке
                              style: TextStyle(
                                fontSize: 13, // Размер текста
                                color: isMissed ? Colors.red : Colors.green, // Цвет текста по статусу
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column( // Правая часть карточки с кнопкой звонка
                    mainAxisSize: MainAxisSize.min, // Минимальный размер по содержимому
                    crossAxisAlignment: CrossAxisAlignment.end, // Выравнивание справа
                    children: [
                      IconButton( // Кнопка для инициирования звонка
                        onPressed: () { // Действие при нажатии
                          ScaffoldMessenger.of(context).showSnackBar( // Показываем уведомление
                            const SnackBar(content: Text('Совершается звонок...')), // Текст сообщения
                          );
                        },
                        icon: const Icon(Icons.phone_callback), // Иконка телефона
                        color: Colors.black87, // Цвет иконки
                        iconSize: 24, // Размер иконки
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
