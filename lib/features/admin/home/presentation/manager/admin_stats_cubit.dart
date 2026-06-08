import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/admin/home/domain/use_cases/get_admin_stats_use_case.dart';

import 'admin_stats_state.dart';

@injectable
class AdminStatsCubit extends Cubit<AdminStatsState> {
  final GetAdminStatsUseCase getAdminStatsUseCase;

  AdminStatsCubit(this.getAdminStatsUseCase) : super(AdminStatsInitialState());

  Future<void> getAdminStats() async {
    emit(AdminStatsLoadingState());
    final result = await getAdminStatsUseCase.call();
    result.fold(
      (failure) => emit(AdminStatsErrorState(failure.message)),
      (response) => emit(AdminStatsLoadedState(response)),
    );
  }
}
