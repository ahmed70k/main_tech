import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_tech/features/admin/home/presentation/widgets/quick_action_card.dart';
import '../../../../../core/utils/colors/app_colors.dart';
import '../../../../../core/utils/styles/app_styles.dart';
import '../../../presentation/manager/admin_layout_cubit.dart';
import '../../../subscriptions/presentation/pages/admin_subscriptions_screen.dart';
import '../../../subscriptions_plans/presentation/pages/admin_subscriptions_plans_screen.dart';
import '../../domain/entities/admin_stats_entity.dart';
import '../manager/admin_stats_cubit.dart';
import 'admin_stat_card.dart';
class AdminStatsContent extends StatelessWidget {
  final AdminStatsDataEntity stats;
  const AdminStatsContent({super.key, required this.stats});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryCyan,
      onRefresh: () => context.read<AdminStatsCubit>().getAdminStats(),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
        children: [
          Text('Dashboard', style: AppStyles.titleStyle),
          const SizedBox(height: 4),
          Text(
            'Admin statistics overview',
            style: AppStyles.inputLabelStyle.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
            children: [
              AdminStatCard(
                icon: Icons.people_outline,
                label: 'Users',
                value: '${stats.users ?? 0}',
                iconColor: AppColors.primaryCyan,
                onTap: () => context.read<AdminLayoutCubit>().changeTab(1),
              ),
              AdminStatCard(
                icon: Icons.card_membership_outlined,
                label: 'Active Subscriptions',
                value: '${stats.activeSubscriptions ?? 0}',
                iconColor: Colors.greenAccent,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdminSubscriptionsScreen(),
                  ),
                ),
              ),
              AdminStatCard(
                icon: Icons.search,
                label: 'Daily Searches',
                value: '${stats.dailySearches ?? 0}',
                iconColor: AppColors.textYellow,
              ),
              AdminStatCard(
                icon: Icons.calendar_month_outlined,
                label: 'Monthly Searches',
                value: '${stats.monthlySearches ?? 0}',
                iconColor: AppColors.micCardGradientStart,
              ),
            ],
          ),
          const SizedBox(height: 28),
          Text('Management', style: AppStyles.sectionTitleStyle),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: QuickActionCard(
                  icon: Icons.card_membership_outlined,
                  title: 'Subscription Plans',
                  subtitle: 'Create & Edit Plans',
                  gradientColors: const [Color(0xFF1E3C72), Color(0xFF2A5298)],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminSubscriptionsPlansScreen(),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: QuickActionCard(
                  icon: Icons.view_list_outlined,
                  title: 'User Subscriptions',
                  subtitle: 'Assign & View active',
                  gradientColors: const [Color(0xFF0F9B0F), Color(0xFF00796B)],
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminSubscriptionsScreen(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (stats.topUsers.isNotEmpty) ...[
            const SizedBox(height: 28),
            Text('Top Users', style: AppStyles.sectionTitleStyle),
            const SizedBox(height: 12),
            ...stats.topUsers.map(
                  (user) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.cardBorderColor),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primaryCyan.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        color: AppColors.primaryCyan,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      'User #${user.userId ?? '-'}',
                      style: AppStyles.inputLabelStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}