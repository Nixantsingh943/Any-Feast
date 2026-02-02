import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'theme/theme_controller.dart';

void main() {
  runApp(const AnyFeastApp());
}

class AnyFeastApp extends StatelessWidget {
  const AnyFeastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AnyFeast',

          
          themeMode: themeMode,

          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.orange,
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.orange,
            scaffoldBackgroundColor: Colors.black,
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}