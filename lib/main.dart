import 'package:anniversary_date_app/heart_card.dart';
import 'package:flutter/material.dart';
import 'package:anniversary_date_app/since_time.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  ThemeData get theme => ThemeData.from(
        colorScheme: colorScheme,
      );

  ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 67, 35, 65),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loading Indicator',
      theme: theme,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary,
              colorScheme.onSecondaryContainer,
            ],
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SinceTime(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
