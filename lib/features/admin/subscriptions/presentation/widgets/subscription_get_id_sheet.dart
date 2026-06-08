import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/manager/subscriptions_cubit.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/core/widgets/sheet_action_button.dart';

import 'update_id_subscription_form.dart';

class SubscriptionGetIdSheet extends StatelessWidget {
  final SubscriptionEntity subscription;
  final SubscriptionsCubit cubit;

  const SubscriptionGetIdSheet({
    super.key,
    required this.subscription,
    required this.cubit,
  });

  static Future<void> show(
    BuildContext context, {
    required SubscriptionEntity subscription,
    required SubscriptionsCubit cubit,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SubscriptionGetIdSheet(
        subscription: subscription,
        cubit: cubit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isActive = subscription.isActive ?? false;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.inactiveDot,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Subscription Details', style: AppStyles.titleStyle),
          const SizedBox(height: 20),
          _DetailRow(
            label: 'User',
            value: subscription.user?.fullName ?? '-',
          ),
          _DetailRow(
            label: 'Email',
            value: subscription.user?.email ?? '-',
          ),
          _DetailRow(
            label: 'Plan',
            value: subscription.plan?.name ?? '-',
          ),
          _DetailRow(
            label: 'Price',
            value: subscription.plan?.price?.toStringAsFixed(2) ?? '-',
          ),
          _DetailRow(
            label: 'Duration',
            value: '${subscription.plan?.durationDays ?? 0} days',
          ),
          _DetailRow(
            label: 'Starts',
            value: _formatDate(subscription.startsAt),
          ),
          _DetailRow(
            label: 'Ends',
            value: _formatDate(subscription.endsAt),
          ),
          _DetailRow(
            label: 'Status',
            value: isActive ? 'Active' : 'Inactive',
          ),
          _DetailRow(label: 'ID', value: '${subscription.id ?? '-'}'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SheetActionButton(
                  text: 'Edit',
                  icon: Icons.edit_rounded,
                  backgroundColor: const Color(0xFF143D4B),
                  contentColor: const Color(0xFF0BD1ED),
                  border: Border.all(
                    color: const Color(0xFF0BD1ED).withValues(alpha: 0.3),
                    width: 1,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    UpdateIdSubscriptionForm.show(
                      context,
                      subscription: subscription,
                      cubit: cubit,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SheetActionButton(
                  text: 'Delete',
                  icon: Icons.delete_outline_rounded,
                  backgroundColor: const Color(0xFF4A2529),
                  contentColor: const Color(0xFFFF5252),
                  border: Border.all(
                    color: const Color(0xFFFF5252).withValues(alpha: 0.3),
                    width: 1,
                  ),
                  onPressed: () async {
                    final confirmed = await AppDialogs.showConfirmation(
                      context,
                      title: 'حذف الاشتراك',
                      message:
                          'هل أنت متأكد من حذف اشتراك "${subscription.user?.fullName ?? 'هذا المستخدم'}"؟',
                    );
                    if (confirmed != true || !context.mounted) return;
                    Navigator.pop(context);
                    if (subscription.id != null) {
                      await cubit.deleteIdSubscription(subscription.id!);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return date.toLocal().toString().split('.').first;
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppStyles.inputLabelStyle.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppStyles.inputLabelStyle.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
