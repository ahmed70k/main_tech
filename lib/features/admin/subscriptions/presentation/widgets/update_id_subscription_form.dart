import 'package:flutter/material.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/admin/subscriptions/domain/entities/subscription_entity.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/manager/subscriptions_cubit.dart';
import 'package:main_tech/features/auth/widgets/app_text_form.dart';
import 'package:main_tech/features/auth/widgets/mic_card_gradient_start.dart';

class UpdateIdSubscriptionForm extends StatefulWidget {
  final SubscriptionEntity subscription;
  final SubscriptionsCubit cubit;

  const UpdateIdSubscriptionForm({
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
      isScrollControlled: true,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: UpdateIdSubscriptionForm(
          subscription: subscription,
          cubit: cubit,
        ),
      ),
    );
  }

  @override
  State<UpdateIdSubscriptionForm> createState() =>
      _UpdateIdSubscriptionFormState();
}

class _UpdateIdSubscriptionFormState extends State<UpdateIdSubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _userIdController;
  late final TextEditingController _planIdController;
  late final TextEditingController _startDateController;
  late final TextEditingController _endDateController;
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _userIdController = TextEditingController(
      text: '${widget.subscription.userId ?? ''}',
    );
    _planIdController = TextEditingController(
      text: '${widget.subscription.planId ?? ''}',
    );
    _startDateController = TextEditingController(
      text: _formatDateForApi(widget.subscription.startsAt),
    );
    _endDateController = TextEditingController(
      text: _formatDateForApi(widget.subscription.endsAt),
    );
    _isActive = widget.subscription.isActive ?? false;
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _planIdController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  String _formatDateForApi(DateTime? date) {
    if (date == null) return '';
    final local = date.toLocal();
    final year = local.year.toString().padLeft(4, '0');
    final month = local.month.toString().padLeft(2, '0');
    final day = local.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  String? _validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the date';
    }
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Use format YYYY-MM-DD';
    }
    return null;
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
            Text('Update Subscription', style: AppStyles.titleStyle),
            const SizedBox(height: 20),
            Text('User ID', style: AppStyles.inputLabelStyle),
            const SizedBox(height: 8),
            AppTextForm(
              controller: _userIdController,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.person_outline),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the user ID';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid user ID';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text('Plan ID', style: AppStyles.inputLabelStyle),
            const SizedBox(height: 8),
            AppTextForm(
              controller: _planIdController,
              keyboardType: TextInputType.number,
              prefixIcon: const Icon(Icons.card_membership_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the plan ID';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid plan ID';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Text('Start Date', style: AppStyles.inputLabelStyle),
            const SizedBox(height: 8),
            AppTextForm(
              controller: _startDateController,
              prefixIcon: const Icon(Icons.calendar_today_outlined),
              validator: _validateDate,
            ),
            const SizedBox(height: 16),
            Text('End Date', style: AppStyles.inputLabelStyle),
            const SizedBox(height: 8),
            AppTextForm(
              controller: _endDateController,
              prefixIcon: const Icon(Icons.event_outlined),
              validator: _validateDate,
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Active', style: AppStyles.inputLabelStyle),
              value: _isActive,
              activeThumbColor: AppColors.primaryCyan,
              onChanged: (value) => setState(() => _isActive = value),
            ),
            const SizedBox(height: 20),
            MicCardGradientStart(
              cardText: 'Save Changes',
              color: AppColors.primaryCyan,
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    widget.subscription.id != null) {
                  Navigator.pop(context);
                  widget.cubit.updateIdSubscription(
                    id: widget.subscription.id!,
                    userId: int.parse(_userIdController.text.trim()),
                    planId: int.parse(_planIdController.text.trim()),
                    startDate: _startDateController.text.trim(),
                    endDate: _endDateController.text.trim(),
                    isActive: _isActive,
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
