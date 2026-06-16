class Endpoints {
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';
  static const String sendOtp = 'auth/send-otp';
  static const String resetPasswordOtp = 'auth/reset-password-otp';
  static const String refreshToken = 'auth/refresh-token';
  static const String subscriptionPlans = 'subscription-plans';
  static const String subscriptions = 'subscriptions';
  static const String subscriptionsAssign = 'subscriptions/assign';
  static const String notifications = 'notifications';
  static const String notificationsUnread = 'notifications/unread';
  static const String notificationsUnreadCount = 'notifications/unread/count';
  static const String markAllNotificationsAsRead = 'notifications/read-all';
  static String markNotificationAsRead(String id) => 'notifications/$id/mark-as-read';
  static String deleteNotification(String id) => 'notifications/$id';
  static const String profile = 'profile';
  static const String adminStats = 'dashboard/admin-stats';
  static const String adminUsers = 'admin/users';
  static String subscriptionPlanById(int id) => '$subscriptionPlans/$id';
  static String subscriptionById(int id) => '$subscriptions/$id';
  static String adminUserById(int id) => '$adminUsers/$id';
}