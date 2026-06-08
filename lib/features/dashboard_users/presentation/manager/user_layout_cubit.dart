import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'user_layout_state.dart';

@injectable
class UserLayoutCubit extends Cubit<UserLayoutState> {
  UserLayoutCubit() : super(UserLayoutInitial());

  int currentIndex = 0;

  void changeTab(int newIndex) {
    currentIndex = newIndex;
    emit(UserLayoutTabChanged(newIndex));
  }
}
