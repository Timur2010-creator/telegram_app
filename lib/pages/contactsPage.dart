import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  final List<Map<String, String>> contacts = const [
    // Список данных для контактов
    {
      'name': 'Аня', // Имя контакта
      'lastSeen': 'Last seen 2m ago', // Последняя активность
      'phoneNumber': '+996220123009', // Номер телефона
      'image': 'https://avatars.mds.yandex.net/i?id=61978395458b43651421108a3a3b24af3d496c9a-12421685-images-thumbs&n=13', // Ссылка на аватарку
    },
    {
      'name': 'Максим',
      'lastSeen': 'Last seen at 3:45 PM',
      'phoneNumber': '+996703225654',
      'image': 'https://avatars.mds.yandex.net/i?id=8fdc49a37ef477d27d66c47d1e81e6e28d9cd610-4365707-images-thumbs&n=13',
          
    },
    {
      'name': 'Бека',
      'lastSeen': 'Last seen yesterday at 9:18 PM',
      'phoneNumber': '+996265111222',
      'image':'https://avatars.mds.yandex.net/i?id=e12172e531bbbf62209350215c93bd3dbd1b32e1-4565467-images-thumbs&n=13',
    },
          
    {
      'name': 'tttimur02',
      'lastSeen': 'Online',
      'phoneNumber': '+996700112355',
      'image': 'https://avatars.mds.yandex.net/i?id=1b9d292b10b26aef341487b345c545a825333292-13465740-images-thumbs&n=13',
          
    },
    {
      'name': 'Медер байке АВТОРИТЕТ',
      'lastSeen': 'Last seen right now',
      'phoneNumber': '+996666999090',
      'image': 'https://media.licdn.com/dms/image/v2/D4D22AQHABRiBQXzUPw/feedshare-shrink_800/B4DZR1Qp4qHEAo-/0/1737134096081?e=2147483647&v=beta&t=3lVfb2pmwxTnkSLc3bcaVgqIWxjzChNjzXidSudg_PQ',
          
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Контакты')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16), // Отступы вокруг сетки
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Две карточки в одной строке
          crossAxisSpacing: 12, // Горизонтальный отступ между карточками
          mainAxisSpacing: 12, // Вертикальный отступ между карточками
          childAspectRatio: 0.8, // Соотношение сторон карточки
        ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index]; // Текущий контакт

          return Container(
            padding: const EdgeInsets.all(16), // Внутренний отступ карточки
            decoration: BoxDecoration(
              color: Colors.white, // Белый фон карточки
              borderRadius: BorderRadius.circular(16), // Скругление углов
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), // Лёгкая тень
                  blurRadius: 6, // Размытие тени
                  offset: const Offset(0, 2), // Смещение тени
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Центрируем по вертикали
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Центрируем по горизонтали
              children: [
                CircleAvatar(
                  radius: 55, // Увеличенный размер аватарки
                  backgroundImage: NetworkImage(
                    contact['image']!,
                  ), // Изображение из сети
                ),

                const SizedBox(height: 16), // Отступ под аватаркой

                Text(
                  contact['name']!, // Имя контакта
                  textAlign: TextAlign.center, // Текст по центру
                  style: const TextStyle(
                    fontSize: 18, // Размер шрифта имени
                    fontWeight: FontWeight.bold, // Жирный текст имени
                    color: Colors.blueGrey, // Цвет имени
                  ),
                ),

                const SizedBox(height: 10), // Отступ между именем и телефоном

                Text(
                  contact['phoneNumber']!, // Номер телефона
                  textAlign: TextAlign.center, // Текст по центру
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold, // Размер шрифта номера
                    color: Colors.black87, // Цвет телефона
                  ),
                ),
                Column(
                  // Время посещения: справа от карточки не прилеплено к тексту сообщений
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      contact['lastSeen']!, // Время отправки сообщения
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
          );
        },
      ),
    );
  }
}
