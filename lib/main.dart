import 'package:flutter/material.dart';
import 'package:anniversary_date_app/widgets/since_time.dart';

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
              colorScheme.onTertiaryContainer,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text('Add date'),
            icon: const Icon(Icons.date_range_outlined),
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          body: const Center(
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
