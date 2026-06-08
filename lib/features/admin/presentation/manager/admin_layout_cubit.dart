import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'admin_layout_state.dart';

@injectable
class AdminLayoutCubit extends Cubit<AdminLayoutState> {
  AdminLayoutCubit() : super(AdminLayoutInitial());

  int currentIndex = 0;

  void changeTab(int newIndex) {
    currentIndex = newIndex;
    emit(AdminLayoutTabChanged(newIndex));
  }
}
