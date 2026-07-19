import 'package:flutter/material.dart';

class ThemeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ThemeAppState();
}

class ThemeAppState extends State<ThemeApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toogleTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThemeApp',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.blueGrey,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blueAccent),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurpleAccent),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurpleAccent,
        ),
      ),
      home: HomePage(
        onToggleTheme: toogleTheme,
        themeMode: themeMode,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  HomePage({super.key, required this.onToggleTheme, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ThemeApp')),
      floatingActionButton: FloatingActionButton(
        onPressed: onToggleTheme,
        child: Icon(
          themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
        ),
      ),
      body: Center(
        child: Text(themeMode == ThemeMode.light ? 'Светлая тема' : 'Темная тема',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
