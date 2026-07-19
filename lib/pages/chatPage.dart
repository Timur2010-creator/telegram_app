import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, String>> chats = const [ // Список данных для чатов
    {
      'name': 'Аня', // Имя контакта
      'message': 'Крутой проект наверно будет. А когда собираешься сдавать?', // Текст последнего сообщения
      'image': 'https://avatars.mds.yandex.net/i?id=61978395458b43651421108a3a3b24af3d496c9a-12421685-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': 'Sent 2m ago', // Время отправки
    },
    {
      'name': 'Максим', // Имя контакта
      'message': 'Когда проект сдадите??!!', // Текст последнего сообщения
      'image': 'https://avatars.mds.yandex.net/i?id=8fdc49a37ef477d27d66c47d1e81e6e28d9cd610-4365707-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': 'Sent 1h ago', // Время отправки
    },
    {
      'name': 'Бека', // Имя контакта
      'message': 'Ну чо гулять выйдешь?', // Текст последнего сообщения
      'image': 'https://avatars.mds.yandex.net/i?id=e12172e531bbbf62209350215c93bd3dbd1b32e1-4565467-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': 'Sent 2h ago', // Время отправки
    },
    {
      'name': 'tttimur02', // Имя контакта
      'message': 'Приуэт ;)', // Текст последнего сообщения
      'image': 'https://avatars.mds.yandex.net/i?id=1b9d292b10b26aef341487b345c545a825333292-13465740-images-thumbs&n=13', // Ссылка на аватарку
      'timeAgo': 'Sent 45m ago', // Время отправки
    },
    {
      'name': 'Медер байке АВТОРИТЕТ', // Имя контакта
      'message': 'Я директор еще раз говорю, Я ДИРЕКТОР!', // Текст последнего сообщения
      'image': 'https://media.licdn.com/dms/image/v2/D4D22AQHABRiBQXzUPw/feedshare-shrink_800/B4DZR1Qp4qHEAo-/0/1737134096081?e=2147483647&v=beta&t=3lVfb2pmwxTnkSLc3bcaVgqIWxjzChNjzXidSudg_PQ', // Ссылка на аватарку
      'timeAgo': 'Sent 2m ago', // Время отправки
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Основной каркас страницы
      appBar: AppBar(title: const Text('Чаты')), // Верхняя панель с заголовком
      body: ListView.builder( // Список, который создает элементы по данным
        padding: const EdgeInsets.all(12), // Внутренние отступы списка
        itemCount: chats.length, // Количество элементов в списке
        itemBuilder: (context, index) {
          final chat = chats[index]; // Получаем текущий чат по индексу

          return Padding(
            padding: const EdgeInsets.only(bottom: 12), // Отступ между элементами списка
            child: Container(
              padding: const EdgeInsets.all(12), // Внутренние отступы карточки
              decoration: BoxDecoration(
                color: Colors.white, // Цвет фона карточки
                borderRadius: BorderRadius.circular(16), // Скругление углов
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05), // Цвет тени
                    blurRadius: 6, // Размытие тени
                    offset: const Offset(0, 2), // Смещение тени
                  ),
                ],
              ),
              child: Row( // Размещение аватарки и основной области чата в одну строку
                children: [
                  CircleAvatar(
                    radius: 28, // Размер аватарки
                    backgroundImage: NetworkImage(chat['image']!), // Изображение из сети
                  ),

                  const SizedBox(width: 12), // Отступ между аватаркой и блоком текста

                  Expanded( // Основной блок занимает всё доступное пространство между аватаром и временем
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded( // Колонка с именем и сообщением слева
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat['name']!, // Имя контакта
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),

                              const SizedBox(height: 4), // Отступ между именем и сообщением
                              
                              Text(
                                chat['message']!, // Текст последнего сообщения
                                maxLines: 2, // В две строки 
                                overflow: TextOverflow.ellipsis, // Сокращаем длинный текст
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12), // Отступ между текстом и временем

                        Column( // Время — справа от карточки не прилеплено к тексту сообщений
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              chat['timeAgo']!, // Время отправки сообщения
                              maxLines: 1, // В одну строку
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
