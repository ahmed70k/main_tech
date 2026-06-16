import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/auth/widgets/app_text_form.dart';
import 'package:main_tech/features/auth/widgets/mic_card_gradient_start.dart';
import '../manager/subscription_plans_cubit.dart';
import '../manager/subscription_plans_state.dart';

class CreateSubscriptionPlanForm extends StatefulWidget {
  final SubscriptionPlansCubit cubit;
  const CreateSubscriptionPlanForm({super.key, required this.cubit});

  @override
  State<CreateSubscriptionPlanForm> createState() =>
      _CreateSubscriptionPlanFormState();
}

class _CreateSubscriptionPlanFormState
    extends State<CreateSubscriptionPlanForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _durationController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _nameController.clear();
    _priceController.clear();
    _durationController.clear();
    _descriptionController.clear();
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionPlansCubit, SubscriptionPlansState>(
      bloc: widget.cubit,
      listener: (context, state) {
        if (state is SubscriptionPlansCreateSuccessState) {
          _clearForm();
          FocusScope.of(context).unfocus();
        }
      },
      child: Form(
        key: _formKey,
        child: Card(
          color: AppColors.cardBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text('Plan Name', style: AppStyles.inputLabelStyle),
                const SizedBox(height: 12),
                AppTextForm(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
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
                const SizedBox(height: 10),
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
                const SizedBox(height: 12),
                Text('Duration (Days)', style: AppStyles.inputLabelStyle),
                const SizedBox(height: 12),
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
                const SizedBox(height: 12),
                Text('Description', style: AppStyles.inputLabelStyle),
                const SizedBox(height: 12),
                AppTextForm(
                  controller: _descriptionController,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                MicCardGradientStart(
                  cardText: 'Create Plan',
                  color: AppColors.primaryCyan,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.cubit.createSubscriptionPlan(
                        name: _nameController.text.trim(),
                        price: double.parse(_priceController.text.trim()),
                        durationDays:
                            int.parse(_durationController.text.trim()),
                        description: _descriptionController.text.trim(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
