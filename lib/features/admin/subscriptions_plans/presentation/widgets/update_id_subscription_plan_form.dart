import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/admin/subscriptions_plans/domain/entities/subscription_plan_entity.dart';
import 'package:main_tech/features/admin/subscriptions_plans/presentation/manager/subscription_plans_cubit.dart';
import 'package:main_tech/features/auth/widgets/app_text_form.dart';
import 'package:main_tech/features/auth/widgets/mic_card_gradient_start.dart';

class UpdateIdSubscriptionPlanForm extends StatefulWidget {
  final SubscriptionPlanEntity plan;
  final SubscriptionPlansCubit cubit;

  const UpdateIdSubscriptionPlanForm({
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
      isScrollControlled: true,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: UpdateIdSubscriptionPlanForm(plan: plan, cubit: cubit),
      ),
    );
  }

  @override
  State<UpdateIdSubscriptionPlanForm> createState() =>
      _UpdateIdSubscriptionPlanFormState();
}

class _UpdateIdSubscriptionPlanFormState
    extends State<UpdateIdSubscriptionPlanForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;
  late final TextEditingController _durationController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.plan.name ?? '');
    _priceController = TextEditingController(
      text: widget.plan.price?.toString() ?? '',
    );
    _durationController = TextEditingController(
      text: widget.plan.durationDays?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Form(
        key: _formKey,
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
            Text('Update Plan', style: AppStyles.titleStyle),
            const SizedBox(height: 20),
            Text('Plan Name', style: AppStyles.inputLabelStyle),
            const SizedBox(height: 8),
            AppTextForm(
              controller: _nameController,
              prefixIcon: const Icon(Icons.card_membership_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the plan name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text('Price', style: AppStyles.inputLabelStyle),
            const SizedBox(height: 8),
            AppTextForm(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              prefixIcon: const Icon(Icons.attach_money_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the price';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid price';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text('Duration (Days)', style: AppStyles.inputLabelStyle),
            const SizedBox(height: 8),
            AppTextForm(
              controller: _durationController,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.calendar_today_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the duration in days';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number of days';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            MicCardGradientStart(
              cardText: 'Save Changes',
              color: AppColors.primaryCyan,
              onPressed: () {
                if (_formKey.currentState!.validate() && widget.plan.id != null) {
                  Navigator.pop(context);
                  widget.cubit.updateIdSubscriptionPlan(
                    id: widget.plan.id!,
                    name: _nameController.text.trim(),
                    price: double.parse(_priceController.text.trim()),
                    durationDays: int.parse(_durationController.text.trim()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
