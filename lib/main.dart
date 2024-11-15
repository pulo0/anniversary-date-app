import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/widgets/tab_screen.dart';
import 'package:anniversary_date_app/logic/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
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
      themeMode: themeMode(),
      home: const TabScreen(),
    );
  }
}
