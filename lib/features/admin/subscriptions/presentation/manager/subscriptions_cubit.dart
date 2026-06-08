import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';
import 'package:main_tech/features/admin/subscriptions/domain/use_cases/assign_subscription_use_case.dart';
import 'package:main_tech/features/admin/subscriptions/domain/use_cases/delete_id_subscription_use_case.dart';
import 'package:main_tech/features/admin/subscriptions/domain/use_cases/get_id_subscription_use_case.dart';
import 'package:main_tech/features/admin/subscriptions/domain/use_cases/get_subscriptions_use_case.dart';
import 'package:main_tech/features/admin/subscriptions/domain/use_cases/update_id_subscription_use_case.dart';

import 'subscriptions_state.dart';

@injectable
class SubscriptionsCubit extends Cubit<SubscriptionsState> {
  final GetSubscriptionsUseCase getSubscriptionsUseCase;
  final GetIdSubscriptionUseCase getIdSubscriptionUseCase;
  final UpdateIdSubscriptionUseCase updateIdSubscriptionUseCase;
  final DeleteIdSubscriptionUseCase deleteIdSubscriptionUseCase;
  final AssignSubscriptionUseCase assignSubscriptionUseCase;

  SubscriptionsCubit(
    this.getSubscriptionsUseCase,
    this.getIdSubscriptionUseCase,
    this.updateIdSubscriptionUseCase,
    this.deleteIdSubscriptionUseCase,
    this.assignSubscriptionUseCase,
  ) : super(SubscriptionsInitialState());

  SubscriptionsListEntity? _cachedList;

  Future<void> getSubscriptions({int? page}) async {
    emit(SubscriptionsListLoadingState());
    final result = await getSubscriptionsUseCase.call(page: page);
    result.fold(
      (failure) => emit(SubscriptionsListErrorState(failure.message)),
      (response) {
        _cachedList = response;
        emit(SubscriptionsListLoadedState(response));
      },
    );
  }

  Future<void> getIdSubscription(int id) async {
    emit(SubscriptionsGetIdLoadingState(cachedList: _cachedList));
    final result = await getIdSubscriptionUseCase.call(id);
    result.fold(
      (failure) => emit(SubscriptionsGetIdErrorState(failure.message)),
      (response) => emit(SubscriptionsGetIdLoadedState(response)),
    );
  }

  void restoreListState() {
    if (_cachedList != null) {
      emit(SubscriptionsListLoadedState(_cachedList!));
    }
  }

  Future<void> updateIdSubscription({
    required int id,
    required int userId,
    required int planId,
    required String startDate,
    required String endDate,
    required bool isActive,
  }) async {
    emit(SubscriptionsUpdateIdLoadingState(cachedList: _cachedList));
    final result = await updateIdSubscriptionUseCase.call(
      id: id,
      userId: userId,
      planId: planId,
      startDate: startDate,
      endDate: endDate,
      isActive: isActive,
    );
    await result.fold(
      (failure) async {
        emit(
          SubscriptionsUpdateIdErrorState(
            failure.message,
            cachedList: _cachedList,
          ),
        );
        if (_cachedList != null) {
          emit(SubscriptionsListLoadedState(_cachedList!));
        }
      },
      (response) async {
        emit(SubscriptionsUpdateIdSuccessState(response));
        await getSubscriptions();
      },
    );
  }

  Future<void> deleteIdSubscription(int id) async {
    emit(SubscriptionsDeleteIdLoadingState(cachedList: _cachedList));
    final result = await deleteIdSubscriptionUseCase.call(id);
    await result.fold(
      (failure) async {
        emit(
          SubscriptionsDeleteIdErrorState(
            failure.message,
            cachedList: _cachedList,
          ),
        );
        if (_cachedList != null) {
          emit(SubscriptionsListLoadedState(_cachedList!));
        }
      },
      (response) async {
        emit(SubscriptionsDeleteIdSuccessState(response));
        await getSubscriptions();
      },
    );
  }

  Future<void> assignSubscription({
    required int userId,
    required int planId,
  }) async {
    emit(SubscriptionsAssignLoadingState(cachedList: _cachedList));
    final result = await assignSubscriptionUseCase.call(
      userId: userId,
      planId: planId,
    );
    await result.fold(
      (failure) async {
        emit(
          SubscriptionsAssignErrorState(
            failure.message,
            cachedList: _cachedList,
          ),
        );
        if (_cachedList != null) {
          emit(SubscriptionsListLoadedState(_cachedList!));
        }
      },
      (response) async {
        emit(SubscriptionsAssignSuccessState(response));
        await getSubscriptions();
      },
    );
  }
}
