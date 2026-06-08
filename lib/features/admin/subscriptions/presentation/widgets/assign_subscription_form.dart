import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/manager/subscriptions_cubit.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/manager/subscriptions_state.dart';
import 'package:main_tech/features/auth/widgets/app_text_form.dart';
import 'package:main_tech/features/auth/widgets/mic_card_gradient_start.dart';

class AssignSubscriptionForm extends StatefulWidget {
  final SubscriptionsCubit cubit;

  const AssignSubscriptionForm({super.key, required this.cubit});

  @override
  State<AssignSubscriptionForm> createState() => _AssignSubscriptionFormState();
}

class _AssignSubscriptionFormState extends State<AssignSubscriptionForm> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _planIdController = TextEditingController();

  @override
  void dispose() {
    _userIdController.dispose();
    _planIdController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _userIdController.clear();
    _planIdController.clear();
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionsCubit, SubscriptionsState>(
      bloc: widget.cubit,
      listener: (context, state) {
        if (state is SubscriptionsAssignSuccessState) {
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
                Text('User ID', style: AppStyles.inputLabelStyle),
                const SizedBox(height: 12),
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
                const SizedBox(height: 12),
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
                const SizedBox(height: 18),
                MicCardGradientStart(
                  cardText: 'Assign Subscription',
                  color: AppColors.primaryCyan,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.cubit.assignSubscription(
                        userId: int.parse(_userIdController.text.trim()),
                        planId: int.parse(_planIdController.text.trim()),
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
