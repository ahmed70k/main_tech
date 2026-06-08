import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/logout_use_case.dart';
import 'logout_state.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit(this.logoutUseCase) : super(LogoutInitialState());

  Future<void> logout() async {
    emit(LogoutLoadingState());
    final result = await logoutUseCase.call();
    result.fold(
      (failure) => emit(LogoutErrorState(failure.message)),
      (response) => emit(LogoutSuccessState(response)),
    );
  }
}
