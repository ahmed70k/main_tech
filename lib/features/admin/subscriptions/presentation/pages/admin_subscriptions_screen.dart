import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/utils/styles/app_styles.dart';
import 'package:main_tech/core/widgets/app_dialog.dart';
import 'package:main_tech/di/di.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/manager/subscriptions_cubit.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/manager/subscriptions_state.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/widgets/assign_subscription_form.dart';
import 'package:main_tech/features/admin/subscriptions/presentation/widgets/subscription_get_id_sheet.dart';

import '../widgets/subscriptions_list_section.dart';

class AdminSubscriptionsScreen extends StatelessWidget {
  const AdminSubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SubscriptionsCubit>()..getSubscriptions(),
      child: BlocListener<SubscriptionsCubit, SubscriptionsState>(
        listener: (context, state) async {
          if (state is SubscriptionsAssignLoadingState ||
              state is SubscriptionsGetIdLoadingState ||
              state is SubscriptionsUpdateIdLoadingState ||
              state is SubscriptionsDeleteIdLoadingState) {
            AppDialogs.showLoading(context);
          } else {
            AppDialogs.hideLoading(context);
          }
          if (state is SubscriptionsGetIdLoadedState) {
            final cubit = context.read<SubscriptionsCubit>();
            final subscription = state.getIdResponse.data;
            if (subscription != null) {
              await SubscriptionGetIdSheet.show(
                context,
                subscription: subscription,
                cubit: cubit,
              );
            } else {
              AppDialogs.showError(
                context,
                title: 'تنبيه',
                message:
                    state.getIdResponse.message ??
                    'لا توجد بيانات لهذا الاشتراك',
              );
            }
            if (!context.mounted) return;
            cubit.restoreListState();
          }
          if (state is SubscriptionsGetIdErrorState) {
            final cubit = context.read<SubscriptionsCubit>();
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
            cubit.restoreListState();
          }
          if (state is SubscriptionsUpdateIdSuccessState) {
            AppDialogs.showSuccess(
              context,
              title: 'تم بنجاح',
              message:
                  state.updateIdResponse.message ??
                  'تم تحديث الاشتراك بنجاح',
            );
          }
          if (state is SubscriptionsUpdateIdErrorState) {
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
          }
          if (state is SubscriptionsDeleteIdSuccessState) {
            AppDialogs.showSuccess(
              context,
              title: 'تم بنجاح',
              message:
                  state.deleteIdResponse.message ??
                  'تم حذف الاشتراك بنجاح',
            );
          }
          if (state is SubscriptionsDeleteIdErrorState) {
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
          }
          if (state is SubscriptionsAssignSuccessState) {
            AppDialogs.showSuccess(
              context,
              title: 'تم بنجاح',
              message: state.response.message ?? 'تم تفعيل الاشتراك',
            );
          }
          if (state is SubscriptionsAssignErrorState) {
            AppDialogs.showError(
              context,
              title: 'خطأ',
              message: state.message,
            );
          }
          if (state is SubscriptionsListErrorState) {
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
                  Text('Subscriptions', style: AppStyles.titleStyle),
                  const SizedBox(height: 4),
                  Text(
                    'Manage user subscriptions',
                    style: AppStyles.inputLabelStyle.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Builder(
                    builder: (context) {
                      return AssignSubscriptionForm(
                        cubit: context.read<SubscriptionsCubit>(),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const SubscriptionsListSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


