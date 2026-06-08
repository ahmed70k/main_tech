abstract class UserLayoutState {}

class UserLayoutInitial extends UserLayoutState {}

class UserLayoutTabChanged extends UserLayoutState {
  final int tabIndex;
  UserLayoutTabChanged(this.tabIndex);
}
