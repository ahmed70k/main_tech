import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/notifications/domain/use_cases/delete_notification_use_case.dart';
import 'package:main_tech/features/notifications/domain/use_cases/get_notifications_use_case.dart';
import 'package:main_tech/features/notifications/domain/use_cases/get_unread_notifications_count_use_case.dart';
import 'package:main_tech/features/notifications/domain/use_cases/get_unread_notifications_use_case.dart';
import 'package:main_tech/features/notifications/domain/use_cases/mark_all_notifications_as_read_use_case.dart';
import 'package:main_tech/features/notifications/domain/use_cases/mark_notification_as_read_use_case.dart';

import 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationsUseCase getNotificationsUseCase;
  final GetUnreadNotificationsUseCase getUnreadNotificationsUseCase;
  final GetUnreadNotificationsCountUseCase getUnreadNotificationsCountUseCase;
  final MarkNotificationAsReadUseCase markNotificationAsReadUseCase;
  final MarkAllNotificationsAsReadUseCase markAllNotificationsAsReadUseCase;
  final DeleteNotificationUseCase deleteNotificationUseCase;

  NotificationsCubit(
    this.getNotificationsUseCase,
    this.getUnreadNotificationsUseCase,
    this.getUnreadNotificationsCountUseCase,
    this.markNotificationAsReadUseCase,
    this.markAllNotificationsAsReadUseCase,
    this.deleteNotificationUseCase,
  ) : super(NotificationsInitialState());

  int unreadCount = 0;

  Future<void> getNotifications({int? page, bool showLoading = true}) async {
    if (showLoading) {
      emit(NotificationsListLoadingState());
    }
    final result = await getNotificationsUseCase.call(page: page);
    result.fold(
      (failure) => emit(NotificationsListErrorState(failure.message)),
      (response) {
        emit(NotificationsListLoadedState(response));
        getUnreadNotificationsCount();
      },
    );
  }

  Future<void> getUnreadNotifications() async {
    emit(NotificationsUnreadLoadingState());
    final result = await getUnreadNotificationsUseCase.call();
    result.fold(
      (failure) => emit(NotificationsUnreadErrorState(failure.message)),
      (response) {
        emit(NotificationsUnreadLoadedState(response));
        getUnreadNotificationsCount();
      },
    );
  }

  Future<void> getUnreadNotificationsCount() async {
    final result = await getUnreadNotificationsCountUseCase.call();
    result.fold(
      (_) {},
      (response) {
        unreadCount = response.count ?? 0;
        emit(NotificationsUnreadCountLoadedState(unreadCount));
      },
    );
  }

  Future<void> markNotificationAsRead(String id) async {
    emit(NotificationsMarkAsReadLoadingState());
    final result = await markNotificationAsReadUseCase.call(id);
    result.fold(
      (failure) => emit(NotificationsMarkAsReadErrorState(failure.message)),
      (response) {
        emit(NotificationsMarkAsReadLoadedState(response));
        getNotifications(showLoading: false);
      },
    );
  }

  Future<void> markAllNotificationsAsRead() async {
    emit(NotificationsMarkAllAsReadLoadingState());
    final result = await markAllNotificationsAsReadUseCase.call();
    result.fold(
      (failure) => emit(NotificationsMarkAllAsReadErrorState(failure.message)),
      (response) {
        emit(NotificationsMarkAllAsReadLoadedState(response));
        getNotifications(showLoading: false);
      },
    );
  }

  Future<void> deleteNotification(String id) async {
    emit(NotificationsDeleteLoadingState());
    final result = await deleteNotificationUseCase.call(id);
    result.fold(
      (failure) => emit(NotificationsDeleteErrorState(failure.message)),
      (response) {
        emit(NotificationsDeleteLoadedState(response));
        getNotifications(showLoading: false);
      },
    );
  }
}
