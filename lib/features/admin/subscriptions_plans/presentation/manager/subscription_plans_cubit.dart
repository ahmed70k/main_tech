import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/use_cases/create_subscription_plan_use_case.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/use_cases/delete_id_subscription_plan_use_case.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/use_cases/get_id_subscription_plan_use_case.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/use_cases/get_subscription_plans_use_case.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/use_cases/update_id_subscription_plan_use_case.dart';

import 'subscription_plans_state.dart';

@injectable
class SubscriptionPlansCubit extends Cubit<SubscriptionPlansState> {
  final GetSubscriptionPlansUseCase getSubscriptionPlansUseCase;
  final GetIdSubscriptionPlanUseCase getIdSubscriptionPlanUseCase;
  final UpdateIdSubscriptionPlanUseCase updateIdSubscriptionPlanUseCase;
  final CreateSubscriptionPlanUseCase createSubscriptionPlanUseCase;
  final DeleteIdSubscriptionPlanUseCase deleteIdSubscriptionPlanUseCase;

  SubscriptionPlansCubit(
    this.getSubscriptionPlansUseCase,
    this.getIdSubscriptionPlanUseCase,
    this.updateIdSubscriptionPlanUseCase,
    this.createSubscriptionPlanUseCase,
    this.deleteIdSubscriptionPlanUseCase,
  ) : super(SubscriptionPlansInitialState());

  SubscriptionPlansListEntity? _cachedList;

  Future<void> getSubscriptionPlans({int? page}) async {
    emit(SubscriptionPlansListLoadingState());
    final result = await getSubscriptionPlansUseCase.call(page: page);
    result.fold(
      (failure) => emit(SubscriptionPlansListErrorState(failure.message)),
      (response) {
        _cachedList = response;
        emit(SubscriptionPlansListLoadedState(response));
      },
    );
  }

  Future<void> getIdSubscriptionPlan(int id) async {
    emit(SubscriptionPlansGetIdLoadingState(cachedList: _cachedList));
    final result = await getIdSubscriptionPlanUseCase.call(id);
    result.fold(
      (failure) => emit(SubscriptionPlansGetIdErrorState(failure.message)),
      (response) => emit(SubscriptionPlansGetIdLoadedState(response)),
    );
  }

  void restoreListState() {
    if (_cachedList != null) {
      emit(SubscriptionPlansListLoadedState(_cachedList!));
    }
  }

  Future<void> updateIdSubscriptionPlan({
    required int id,
    required String name,
    required double price,
    required int durationDays,
  }) async {
    emit(SubscriptionPlansUpdateIdLoadingState(cachedList: _cachedList));
    final result = await updateIdSubscriptionPlanUseCase.call(
      id: id,
      name: name,
      price: price,
      durationDays: durationDays,
    );
    await result.fold(
      (failure) async {
        emit(
          SubscriptionPlansUpdateIdErrorState(
            failure.message,
            cachedList: _cachedList,
          ),
        );
        if (_cachedList != null) {
          emit(SubscriptionPlansListLoadedState(_cachedList!));
        }
      },
      (response) async {
        emit(SubscriptionPlansUpdateIdSuccessState(response));
        await getSubscriptionPlans();
      },
    );
  }

  Future<void> createSubscriptionPlan({
    required String name,
    required double price,
    required int durationDays,
    required String description,
  }) async {
    emit(SubscriptionPlansCreatingState(cachedList: _cachedList));
    final result = await createSubscriptionPlanUseCase.call(
      name: name,
      price: price,
      durationDays: durationDays,
      description: description,
    );
    await result.fold(
      (failure) async {
        emit(
          SubscriptionPlansCreateErrorState(
            failure.message,
            cachedList: _cachedList,
          ),
        );
        if (_cachedList != null) {
          emit(SubscriptionPlansListLoadedState(_cachedList!));
        }
      },
      (response) async {
        emit(SubscriptionPlansCreateSuccessState(response));
        await getSubscriptionPlans();
      },
    );
  }

  Future<void> deleteIdSubscriptionPlan(int id) async {
    emit(SubscriptionPlansDeleteIdLoadingState(cachedList: _cachedList));
    final result = await deleteIdSubscriptionPlanUseCase.call(id);
    await result.fold(
      (failure) async {
        emit(
          SubscriptionPlansDeleteIdErrorState(
            failure.message,
            cachedList: _cachedList,
          ),
        );
        if (_cachedList != null) {
          emit(SubscriptionPlansListLoadedState(_cachedList!));
        }
      },
      (response) async {
        emit(SubscriptionPlansDeleteIdSuccessState(response));
        await getSubscriptionPlans();
      },
    );
  }
}
