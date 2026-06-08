import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';

abstract class SubscriptionsState {}

class SubscriptionsInitialState extends SubscriptionsState {}

class SubscriptionsListLoadingState extends SubscriptionsState {}

class SubscriptionsListLoadedState extends SubscriptionsState {
  final SubscriptionsListEntity listEntity;
  SubscriptionsListLoadedState(this.listEntity);
}

class SubscriptionsListErrorState extends SubscriptionsState {
  final String message;
  SubscriptionsListErrorState(this.message);
}

class SubscriptionsAssignLoadingState extends SubscriptionsState {
  final SubscriptionsListEntity? cachedList;
  SubscriptionsAssignLoadingState({this.cachedList});
}

class SubscriptionsAssignSuccessState extends SubscriptionsState {
  final AssignSubscriptionEntity response;
  SubscriptionsAssignSuccessState(this.response);
}

class SubscriptionsAssignErrorState extends SubscriptionsState {
  final String message;
  final SubscriptionsListEntity? cachedList;
  SubscriptionsAssignErrorState(this.message, {this.cachedList});
}

class SubscriptionsGetIdLoadingState extends SubscriptionsState {
  final SubscriptionsListEntity? cachedList;
  SubscriptionsGetIdLoadingState({this.cachedList});
}

class SubscriptionsGetIdLoadedState extends SubscriptionsState {
  final SubscriptionGetIdEntity getIdResponse;
  SubscriptionsGetIdLoadedState(this.getIdResponse);
}

class SubscriptionsGetIdErrorState extends SubscriptionsState {
  final String message;
  SubscriptionsGetIdErrorState(this.message);
}

class SubscriptionsUpdateIdLoadingState extends SubscriptionsState {
  final SubscriptionsListEntity? cachedList;
  SubscriptionsUpdateIdLoadingState({this.cachedList});
}

class SubscriptionsUpdateIdSuccessState extends SubscriptionsState {
  final SubscriptionUpdateIdEntity updateIdResponse;
  SubscriptionsUpdateIdSuccessState(this.updateIdResponse);
}

class SubscriptionsUpdateIdErrorState extends SubscriptionsState {
  final String message;
  final SubscriptionsListEntity? cachedList;
  SubscriptionsUpdateIdErrorState(this.message, {this.cachedList});
}

class SubscriptionsDeleteIdLoadingState extends SubscriptionsState {
  final SubscriptionsListEntity? cachedList;
  SubscriptionsDeleteIdLoadingState({this.cachedList});
}

class SubscriptionsDeleteIdSuccessState extends SubscriptionsState {
  final DeleteIdSubscriptionEntity deleteIdResponse;
  SubscriptionsDeleteIdSuccessState(this.deleteIdResponse);
}

class SubscriptionsDeleteIdErrorState extends SubscriptionsState {
  final String message;
  final SubscriptionsListEntity? cachedList;
  SubscriptionsDeleteIdErrorState(this.message, {this.cachedList});
}
