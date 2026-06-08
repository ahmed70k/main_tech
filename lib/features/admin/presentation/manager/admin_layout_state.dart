abstract class AdminLayoutState {}

class AdminLayoutInitial extends AdminLayoutState {}

class AdminLayoutTabChanged extends AdminLayoutState {
  final int tabIndex;
  AdminLayoutTabChanged(this.tabIndex);
}
