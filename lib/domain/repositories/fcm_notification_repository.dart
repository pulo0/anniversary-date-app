abstract class FcmNotificationRepository {
  Future<void> initializeFcmNotifications();

  Future<void> subscribeToReminderTopic(String topic);

  Future<void> handleBackgroundNotifications();
}
