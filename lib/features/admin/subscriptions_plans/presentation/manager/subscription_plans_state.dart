import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';

abstract class SubscriptionPlansState {}

class SubscriptionPlansInitialState extends SubscriptionPlansState {}

class SubscriptionPlansListLoadingState extends SubscriptionPlansState {}

class SubscriptionPlansListLoadedState extends SubscriptionPlansState {
  final SubscriptionPlansListEntity listEntity;
  SubscriptionPlansListLoadedState(this.listEntity);
}

class SubscriptionPlansListErrorState extends SubscriptionPlansState {
  final String message;
  SubscriptionPlansListErrorState(this.message);
}

class SubscriptionPlansCreatingState extends SubscriptionPlansState {
  final SubscriptionPlansListEntity? cachedList;
  SubscriptionPlansCreatingState({this.cachedList});
}

class SubscriptionPlansCreateSuccessState extends SubscriptionPlansState {
  final CreateSubscriptionPlanEntity response;
  SubscriptionPlansCreateSuccessState(this.response);
}

class SubscriptionPlansCreateErrorState extends SubscriptionPlansState {
  final String message;
  final SubscriptionPlansListEntity? cachedList;
  SubscriptionPlansCreateErrorState(this.message, {this.cachedList});
}

class SubscriptionPlansGetIdLoadingState extends SubscriptionPlansState {
  final SubscriptionPlansListEntity? cachedList;
  SubscriptionPlansGetIdLoadingState({this.cachedList});
}

class SubscriptionPlansGetIdLoadedState extends SubscriptionPlansState {
  final SubscriptionPlanGetIdEntity getIdResponse;
  SubscriptionPlansGetIdLoadedState(this.getIdResponse);
}

class SubscriptionPlansGetIdErrorState extends SubscriptionPlansState {
  final String message;
  SubscriptionPlansGetIdErrorState(this.message);
}

class SubscriptionPlansUpdateIdLoadingState extends SubscriptionPlansState {
  final SubscriptionPlansListEntity? cachedList;
  SubscriptionPlansUpdateIdLoadingState({this.cachedList});
}

class SubscriptionPlansUpdateIdSuccessState extends SubscriptionPlansState {
  final SubscriptionPlanUpdateIdEntity updateIdResponse;
  SubscriptionPlansUpdateIdSuccessState(this.updateIdResponse);
}

class SubscriptionPlansUpdateIdErrorState extends SubscriptionPlansState {
  final String message;
  final SubscriptionPlansListEntity? cachedList;
  SubscriptionPlansUpdateIdErrorState(this.message, {this.cachedList});
}

class SubscriptionPlansDeleteIdLoadingState extends SubscriptionPlansState {
  final SubscriptionPlansListEntity? cachedList;
  SubscriptionPlansDeleteIdLoadingState({this.cachedList});
}

class SubscriptionPlansDeleteIdSuccessState extends SubscriptionPlansState {
  final DeleteIdSubscriptionPlanEntity deleteIdResponse;
  SubscriptionPlansDeleteIdSuccessState(this.deleteIdResponse);
}

class SubscriptionPlansDeleteIdErrorState extends SubscriptionPlansState {
  final String message;
  final SubscriptionPlansListEntity? cachedList;
  SubscriptionPlansDeleteIdErrorState(this.message, {this.cachedList});
}
