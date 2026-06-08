import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/di/di.dart';
import 'package:main_tech/features/admin/subscriptions_plans/presentation/manager/subscription_plans_cubit.dart';

import '../../../../../core/widgets/app_dialog.dart';
import '../manager/subscription_plans_state.dart';
import '../widgets/create_subscription_plan_form.dart';
import '../widgets/plans_list_section.dart';
import '../widgets/subscription_plan_get_id_sheet.dart';
class AdminSubscriptionsPlansScreen extends StatelessWidget {
  const AdminSubscriptionsPlansScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SubscriptionPlansCubit>()..getSubscriptionPlans(),
      child: BlocListener<SubscriptionPlansCubit, SubscriptionPlansState>(
        listener: (context, state) async {
          if (state is SubscriptionPlansCreatingState ||
              state is SubscriptionPlansGetIdLoadingState ||
              state is SubscriptionPlansUpdateIdLoadingState ||
              state is SubscriptionPlansDeleteIdLoadingState) {
            AppDialogs.showLoading(context);
          } else {
            AppDialogs.hideLoading(context);
          }
          if (state is SubscriptionPlansGetIdLoadedState) {
            final cubit = context.read<SubscriptionPlansCubit>();
            final plan = state.getIdResponse.data;
            if (plan != null) {
              await SubscriptionPlanGetIdSheet.show(
                context,
                plan: plan,
                cubit: cubit,
              );
            }
            if (!context.mounted) return;
            cubit.restoreListState();
          }
          if (state is SubscriptionPlansUpdateIdSuccessState) {
            AppDialogs.showSuccess(
              context,
              title: 'تم بنجاح',
              message:
                  state.updateIdResponse.message ??
                  'تم تحديث خطة الاشتراك بنجاح',
            );
          }
          if (state is SubscriptionPlansUpdateIdErrorState) {
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
          }
          if (state is SubscriptionPlansDeleteIdSuccessState) {
            AppDialogs.showSuccess(
              context,
              title: 'تم بنجاح',
              message:
                  state.deleteIdResponse.message ??
                  'تم حذف خطة الاشتراك بنجاح',
            );
          }
          if (state is SubscriptionPlansDeleteIdErrorState) {
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
          }
          if (state is SubscriptionPlansGetIdErrorState) {
            final cubit = context.read<SubscriptionPlansCubit>();
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
            cubit.restoreListState();
          }
          if (state is SubscriptionPlansCreateSuccessState) {
            AppDialogs.showSuccess(
              context,
              title: 'تم بنجاح',
              message:
                  state.response.message ?? 'تم إنشاء خطة الاشتراك بنجاح',
            );
          }
          if (state is SubscriptionPlansCreateErrorState) {
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
          }
          if (state is SubscriptionPlansListErrorState) {
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Subscription Plans',
                    style: AppStyles.titleStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Manage subscription plans',
                    style: AppStyles.inputLabelStyle.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Builder(
                    builder: (context) {
                      return CreateSubscriptionPlanForm(
                        cubit: context.read<SubscriptionPlansCubit>(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const PlansListSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


