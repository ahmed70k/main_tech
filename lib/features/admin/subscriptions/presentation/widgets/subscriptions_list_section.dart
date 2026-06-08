import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/widgets/subscription_card.dart';
import '../../../../../core/utils/colors/app_colors.dart';
import '../../../../../core/utils/styles/app_styles.dart';
import '../manager/subscriptions_cubit.dart';
import '../manager/subscriptions_state.dart';

class SubscriptionsListSection extends StatelessWidget {
  const SubscriptionsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionsCubit, SubscriptionsState>(
      builder: (context, state) {
        if (state is SubscriptionsListLoadingState) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primaryCyan),
            ),
          );
        }

        final listEntity = switch (state) {
          SubscriptionsListLoadedState(:final listEntity) => listEntity,
          SubscriptionsAssignLoadingState(:final cachedList) => cachedList,
          SubscriptionsAssignErrorState(:final cachedList) => cachedList,
          SubscriptionsGetIdLoadingState(:final cachedList) => cachedList,
          SubscriptionsUpdateIdLoadingState(:final cachedList) => cachedList,
          SubscriptionsUpdateIdErrorState(:final cachedList) => cachedList,
          SubscriptionsDeleteIdLoadingState(:final cachedList) => cachedList,
          SubscriptionsDeleteIdErrorState(:final cachedList) => cachedList,
          _ => null,
        };

        if (listEntity == null) {
          return const SizedBox.shrink();
        }

        final subscriptions = listEntity.data?.subscriptions ?? [];

        if (subscriptions.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              'No subscriptions yet',
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
                'All Subscriptions (${listEntity.data?.total ?? subscriptions.length})',
                style: AppStyles.inputLabelStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...subscriptions.map(
                  (subscription) => SubscriptionCard(
                subscription: subscription,
                onTap: subscription.id == null
                    ? null
                    : () => context
                    .read<SubscriptionsCubit>()
                    .getIdSubscription(subscription.id!),
              ),
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}