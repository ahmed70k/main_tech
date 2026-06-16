import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/core/widgets/sheet_action_button.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/presentation/manager/subscription_plans_cubit.dart';

import 'update_id_subscription_plan_form.dart';

class SubscriptionPlanGetIdSheet extends StatelessWidget {
  final SubscriptionPlanEntity plan;
  final SubscriptionPlansCubit cubit;

  const SubscriptionPlanGetIdSheet({
    super.key,
    required this.plan,
    required this.cubit,
  });

  static Future<void> show(
    BuildContext context, {
    required SubscriptionPlanEntity plan,
    required SubscriptionPlansCubit cubit,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SubscriptionPlanGetIdSheet(plan: plan, cubit: cubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
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
          Text('Plan Details', style: AppStyles.titleStyle),
          const SizedBox(height: 20),
          _DetailRow(label: 'Name', value: plan.name ?? '-'),
          _DetailRow(label: 'Price', value: plan.price?.toStringAsFixed(2) ?? '-'),
          _DetailRow(
            label: 'Duration',
            value: '${plan.durationDays ?? 0} days',
          ),
          if (plan.description != null && plan.description!.isNotEmpty)
            _DetailRow(label: 'Description', value: plan.description!),
          _DetailRow(label: 'ID', value: '${plan.id ?? '-'}'),
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
                    UpdateIdSubscriptionPlanForm.show(
                      context,
                      plan: plan,
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
                      title: 'حذف الخطة',
                      message:
                          'هل أنت متأكد من حذف "${plan.name ?? 'هذه الخطة'}"؟',
                    );
                    if (confirmed != true || !context.mounted) return;
                    Navigator.pop(context);
                    if (plan.id != null) {
                      await cubit.deleteIdSubscriptionPlan(plan.id!);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
