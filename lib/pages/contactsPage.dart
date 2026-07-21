import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

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
    final telegramBlue = const Color(0xFF2AABEE); // цвет Telegram
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
        backgroundColor: telegramBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16), // Отступы вокруг сетки
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Две карточки в одной строке
          crossAxisSpacing: 12, // Горизонтальный отступ между карточками
          mainAxisSpacing: 12, // Вертикальный отступ между карточками
          childAspectRatio: 0.72, // Пропорция карточки (длина карточки)
        ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index]; // Текущий контакт

          return Container(
            padding: const EdgeInsets.all(10), // Внутренние отступы внутри карточки
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)), // Радиус карточек 
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0A1128),
                  Color(0xFF1B0933),
                  Color(0xFF3A0066),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50, 
                  backgroundImage: NetworkImage(
                    contact['image']!,
                  ),
                ),

                const SizedBox(height: 10), 

                Text(
                  contact['name']!,
                  textAlign: TextAlign.center,
                  maxLines: 1, // Ограничение в 1 строку
                  overflow: TextOverflow.ellipsis, // Защита от слишком длинного имени
                  style: const TextStyle(
                    fontSize: 15, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 4), 

                Text(
                  contact['phoneNumber']!,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13, 
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 6), 

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      contact['lastSeen']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, // Защита от переполнения времени
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white54,
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