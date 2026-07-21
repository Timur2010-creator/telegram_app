import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget { 
  const SettingsPage({super.key}); // создание объекта страницы

  @override
  Widget build(BuildContext context) { // метод построения интерфейса
    final telegramBlue = const Color(0xFF2AABEE); // цвет Telegram

    return Scaffold( // главный контейнер страницы
      appBar: AppBar( // верхняя панель
        title: const Text('Настройки'), // заголовок страницы
        centerTitle: true, // центрирование заголовка
        backgroundColor: telegramBlue, // цвет панели
        foregroundColor: Colors.white, // цвет текста на панели
        elevation: 0, // убираем тень
      ),
      body: ListView( // список элементов
        padding: const EdgeInsets.all(16), // отступ со всех сторон
        children: [ // дети списка
          Container( // контейнер профиля
            padding: const EdgeInsets.all(20), // внутренний отступ
            decoration: BoxDecoration( // оформление контейнера
              color: telegramBlue.withOpacity(0.12), // светлый фон
              borderRadius: BorderRadius.circular(20), // скругление углов
            ),
            child: Row( // ряд из аватара и текста
              children: [ // элементы ряда
                CircleAvatar( // круглый аватар
                  radius: 32, // размер аватара
                  backgroundColor: telegramBlue, // фон аватара
                  child: const Icon(Icons.person, size: 36, color: Colors.white), // иконка человека
                ),

                const SizedBox(width: 16), // отступ между элементами

                Expanded( // блок, который занимает доступное место
                  child: Column( // вертикальная колонка (сверху вниз)
                    crossAxisAlignment: CrossAxisAlignment.start, // выравнивание влево
                    children: [ // для нескольких элементов колонок
                      const Text(
                        'tttimur02',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ), 

                      const SizedBox(height: 4), 

                      Text(
                        '+996 700 112 355',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20), 

          _buildSectionTitle('Общие'), // заголовок общих настроек
          _buildSettingsTile(
            icon: Icons.account_circle_outlined,
            title: 'Аккаунт',
            subtitle: 'Личная информация и безопасность',
          ), // пункт аккаунта

          _buildSettingsTile(
            icon: Icons.lock_outline,
            title: 'Конфиденциальность',
            subtitle: 'Управление доступом',
          ), // пункт конфиденциальности

          _buildSettingsTile(
            icon: Icons.notifications_none,
            title: 'Уведомления',
            subtitle: 'Настройка оповещений',
          ), // пункт уведомлений

          const SizedBox(height: 12), 

          _buildSectionTitle('Приложение'), // заголовок секции приложения
          _buildSettingsTile(
            icon: Icons.language,
            title: 'Язык',
            subtitle: 'Русский',
          ), // пункт языка

          _buildSettingsTile(
            icon: Icons.storage_outlined,
            title: 'Данные и память',
            subtitle: 'Освободите место',
          ), // пункт данных и памяти

          _buildSettingsTile(
            icon: Icons.info_outline,
            title: 'О приложении',
            subtitle: 'Версия 1.0.0',
          ), // пункт информации о приложении
        ],
      ),
    );
  }

  static Widget _buildSectionTitle(String title) { // метод для заголовка раздела
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8, top: 4), // отступы вокруг заголовка
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2AABEE),
        ),
      ), // текст заголовка
    );
  }

  static Widget _buildSettingsTile({ // метод для карточки настройки
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10), // отступ снизу
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // скругление углов
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xFF2AABEE).withOpacity(0.12), // светлый фон иконки
          child: Icon(icon, color: const Color(0xFF2AABEE)), // иконка пункта
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ), // название пункта
        subtitle: Text(subtitle), // описание пункта
        trailing: const Icon(Icons.arrow_forward_ios, size: 16), // стрелка вправо
        onTap: () {}, // пустое действие
      ),
    );
  }
}