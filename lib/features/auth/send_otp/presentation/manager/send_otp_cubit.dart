import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/send_otp_use_case.dart';
import 'send_otp_state.dart';

@injectable
class SendOtpCubit extends Cubit<SendOtpState> {
  final SendOtpUseCase sendOtpUseCase;

  SendOtpCubit(this.sendOtpUseCase) : super(SendOtpInitial());

  Future<void> sendOtp({required String email}) async {
    emit(SendOtpLoading());
    final result = await sendOtpUseCase.call(email: email);
    result.fold(
      (failure) => emit(SendOtpErrorState(failure.message)),
      (response) => emit(SendOtpSuccessState(response)),
    );
  }
}
