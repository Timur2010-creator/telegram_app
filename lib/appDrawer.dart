import 'package:flutter/material.dart';
import 'package:flutter_lesson6_meder_group/callPage.dart';
import 'package:flutter_lesson6_meder_group/chatPage.dart';
import 'package:flutter_lesson6_meder_group/contactsPage.dart';
import 'package:flutter_lesson6_meder_group/helpPage.dart';
import 'package:flutter_lesson6_meder_group/settingsPage.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final telegramBlue = Color(0xFF2AABEE);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
            height: 170,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: telegramBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Слева на право
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HelpPage()),
              );
            },
          ),

          Divider(),

          

        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: onTap,
      horizontalTitleGap: 8,
    );
  }
}
