import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/features/admin/subscriptions_plans/presentation/widgets/subscription_plan_card.dart';
import '../../../../../core/utils/colors/app_colors.dart';
import '../../../../../core/utils/styles/app_styles.dart';
import '../manager/subscription_plans_cubit.dart';
import '../manager/subscription_plans_state.dart';

class PlansListSection extends StatelessWidget {
  const PlansListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionPlansCubit, SubscriptionPlansState>(
      builder: (context, state) {
        if (state is SubscriptionPlansListLoadingState) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryCyan),
            ),
          );
        }

        final listEntity = switch (state) {
          SubscriptionPlansListLoadedState(:final listEntity) => listEntity,
          SubscriptionPlansCreatingState(:final cachedList) => cachedList,
          SubscriptionPlansCreateErrorState(:final cachedList) => cachedList,
          SubscriptionPlansGetIdLoadingState(:final cachedList) => cachedList,
          SubscriptionPlansUpdateIdLoadingState(:final cachedList) => cachedList,
          SubscriptionPlansUpdateIdErrorState(:final cachedList) => cachedList,
          SubscriptionPlansDeleteIdLoadingState(:final cachedList) => cachedList,
          SubscriptionPlansDeleteIdErrorState(:final cachedList) => cachedList,
          _ => null,
        };

        if (listEntity == null) {
          return const SizedBox.shrink();
        }

        final plans = listEntity.data?.plans ?? [];

        if (plans.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              'No subscription plans yet',
              style: AppStyles.inputLabelStyle.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'All Plans (${listEntity.data?.total ?? plans.length})',
                style: AppStyles.inputLabelStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...plans.map(
                  (plan) => SubscriptionPlanCard(
                plan: plan,
                onTap: plan.id == null
                    ? null
                    : () => context
                    .read<SubscriptionPlansCubit>()
                    .getIdSubscriptionPlan(plan.id!),
              ),
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}