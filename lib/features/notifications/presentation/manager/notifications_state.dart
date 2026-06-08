import 'package:main_tech/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationsState {}

class NotificationsInitialState extends NotificationsState {}

class NotificationsListLoadingState extends NotificationsState {}

class NotificationsListLoadedState extends NotificationsState {
  final NotificationsListEntity listEntity;
  NotificationsListLoadedState(this.listEntity);
}

class NotificationsListErrorState extends NotificationsState {
  final String message;
  NotificationsListErrorState(this.message);
}

class NotificationsUnreadLoadingState extends NotificationsState {}

class NotificationsUnreadLoadedState extends NotificationsState {
  final UnreadNotificationsListEntity listEntity;
  NotificationsUnreadLoadedState(this.listEntity);
}

class NotificationsUnreadErrorState extends NotificationsState {
  final String message;
  NotificationsUnreadErrorState(this.message);
}

class NotificationsUnreadCountLoadedState extends NotificationsState {
  final int count;
  NotificationsUnreadCountLoadedState(this.count);
}

class NotificationsMarkAsReadLoadingState extends NotificationsState {}

class NotificationsMarkAsReadLoadedState extends NotificationsState {
  final NotificationsListEntity response;
  NotificationsMarkAsReadLoadedState(this.response);
}

class NotificationsMarkAsReadErrorState extends NotificationsState {
  final String message;
  NotificationsMarkAsReadErrorState(this.message);
}

class NotificationsMarkAllAsReadLoadingState extends NotificationsState {}

class NotificationsMarkAllAsReadLoadedState extends NotificationsState {
  final NotificationsListEntity response;
  NotificationsMarkAllAsReadLoadedState(this.response);
}

class NotificationsMarkAllAsReadErrorState extends NotificationsState {
  final String message;
  NotificationsMarkAllAsReadErrorState(this.message);
}

class NotificationsDeleteLoadingState extends NotificationsState {}

class NotificationsDeleteLoadedState extends NotificationsState {
  final NotificationsListEntity response;
  NotificationsDeleteLoadedState(this.response);
}

class NotificationsDeleteErrorState extends NotificationsState {
  final String message;
  NotificationsDeleteErrorState(this.message);
}
