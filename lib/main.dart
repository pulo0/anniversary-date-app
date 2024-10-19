import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/widgets/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anniversary Date App',
      theme: mainTheme(),
      home: const TabScreen(),
    );
  }
}
