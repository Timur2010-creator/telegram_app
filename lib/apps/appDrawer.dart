import 'package:flutter/material.dart';
import 'package:flutter_lesson6_meder_group/pages/callPage.dart';
import 'package:flutter_lesson6_meder_group/pages/chatPage.dart';
import 'package:flutter_lesson6_meder_group/pages/contactsPage.dart';
import 'package:flutter_lesson6_meder_group/pages/helpPage.dart';
import 'package:flutter_lesson6_meder_group/pages/settingsPage.dart';

class AppDrawer extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const AppDrawer({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final telegramBlue = Color(0xFF2AABEE);
    
    // Определяем цвет текста и иконок пунктов меню в зависимости от темы
    final itemColor = isDarkMode ? Colors.white : Colors.black87;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
            height: 170,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: telegramBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Color(0xFF2AABEE)),
                ),
                SizedBox(height: 12),
                Text(
                  'tttimur02',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '+996700112355',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 12),

          drawerItem(
            context,
            icon: Icons.chat,
            title: 'Чаты',
            textColor: itemColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatPage()),
              );
            },
          ),

          drawerItem(
            context,
            icon: Icons.contacts,
            title: 'Контакты',
            textColor: itemColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ContactsPage()),
              );
            },
          ),

          drawerItem(
            context,
            icon: Icons.call,
            title: 'Звонки',
            textColor: itemColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CallPage()),
              );
            },
          ),

          Divider(),

          drawerItem(
            context,
            icon: Icons.settings,
            title: 'Настройки',
            textColor: itemColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsPage()),
              );
            },
          ),

          Divider(),

          drawerItem(
            context,
            icon: Icons.help,
            title: 'Поддержка',
            textColor: itemColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HelpPage()),
              );
            },
          ),

          Divider(),

          // Виджет Свитча с динамической кастомизацией цветов кнопки
          SwitchListTile(
            title: Text(
              isDarkMode ? 'Темная тема' : 'Светлая тема',
              style: TextStyle(color: itemColor, fontWeight: FontWeight.bold),
            ),
            secondary: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: isDarkMode ? Colors.deepPurpleAccent : Colors.orangeAccent, // Цвет иконки слева
            ),
            value: isDarkMode,
            onChanged: onThemeChanged,
            
            // Настройка цветов самого переключателя при изменении темы:
            activeColor: Colors.deepPurpleAccent,                 // Кружок кнопки в Темной теме
            activeTrackColor: Colors.deepPurpleAccent.withOpacity(0.3), // Полоска кнопки в Темной теме
            inactiveThumbColor: Colors.orangeAccent,         // Кружок кнопки в Светлой теме
            inactiveTrackColor: Colors.grey.shade300,    // Полоска кнопки в Светлой теме
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(color: textColor)),
      onTap: onTap,
      horizontalTitleGap: 8,
    );
  }
}