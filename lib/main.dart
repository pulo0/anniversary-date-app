import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/presentation/tab/tab_screen.dart';
import 'package:anniversary_date_app/data/service/service_locator.dart';
import 'package:anniversary_date_app/data/service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  messaging.getToken().then((token) {
    debugPrint('Token - $token');
  });

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

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
      home: const TabScreen(),
    );
  }
}
