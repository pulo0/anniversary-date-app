import 'package:anniversary_date_app/domain/repositories/fcm_notification_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmNotificationRepositoryImpl implements FcmNotificationRepository {
  final FirebaseMessaging _firebaseMessaging;

  const FcmNotificationRepositoryImpl(this._firebaseMessaging);

  @override
  Future<void> subscribeToReminderTopic(String topic) async {
      await _firebaseMessaging.subscribeToTopic(topic);
  }

  @override
  Future<void> initializeFcmNotifications() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      handleBackgroundNotifications();
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> handleBackgroundNotifications() async {
    FirebaseMessaging.onBackgroundMessage(_backgroundNotificationsHandler);
  }

  static Future<void> _backgroundNotificationsHandler(RemoteMessage msg) async {
    print('Background message: ${msg.notification!.body}');
  }
}