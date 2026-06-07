import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/auth/register/domain/use_cases/register_use_case.dart';
import 'package:main_tech/features/auth/register/presentation/manager/register_state.dart';

// todo:hold data => handle logic
@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterViewModel(this.registerUseCase) : super(RegisterInitialState());

  void register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    try {
      var either = await registerUseCase.call(
        email: email,
        password: password,
        fullName: fullName,
        phone: phone,
      );
      either.fold(
        (error) => emit(RegisterErrorState(error.message)),
        (response) => emit(RegisterSuccessState(response)),
      );
    } catch (e) {
      print("RegisterViewModel register error: $e");
      emit(RegisterErrorState(e.toString()));
    }
  }
}
