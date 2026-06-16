import 'package:main_tech/features/admin/home/domain/entities/admin_stats_entity.dart';

abstract class AdminStatsState {}

class AdminStatsInitialState extends AdminStatsState {}

class AdminStatsLoadingState extends AdminStatsState {}

class AdminStatsLoadedState extends AdminStatsState {
  final AdminStatsResponseEntity response;

  AdminStatsLoadedState(this.response);
}

class AdminStatsErrorState extends AdminStatsState {
  final String message;

  AdminStatsErrorState(this.message);
}
