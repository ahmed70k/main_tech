import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/widgets/custom_bottom_nav_bar.dart';
import 'package:main_tech/di/di.dart';
import 'package:main_tech/features/admin/home/presentation/pages/admin_home_screen.dart';
import 'package:main_tech/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:main_tech/features/notifications/presentation/manager/notifications_state.dart';
import 'package:main_tech/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:main_tech/features/notifications/presentation/widgets/notifications_nav_icon.dart';
import 'package:main_tech/features/admin/presentation/manager/admin_layout_cubit.dart';
import 'package:main_tech/features/admin/presentation/manager/admin_layout_state.dart';
import 'package:main_tech/features/profile/presentation/pages/profile_screen.dart';
import 'package:main_tech/features/admin/users/presentation/pages/admin_users_screen.dart';
class AdminLayoutScreen extends StatelessWidget {
  const AdminLayoutScreen({super.key});
  static const int _alertsTabIndex = 2;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<NotificationsCubit>()..getUnreadNotificationsCount(),
        ),
        BlocProvider(create: (_) => getIt<AdminLayoutCubit>()),
      ],
      child: BlocBuilder<AdminLayoutCubit, AdminLayoutState>(
        builder: (context, state) {
          final layoutCubit = context.read<AdminLayoutCubit>();
          return Scaffold(
            backgroundColor: AppColors.background,
            body: IndexedStack(
              index: layoutCubit.currentIndex,
              children: const [
                AdminHomeScreen(),
                AdminUsersScreen(),
                NotificationsScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BlocBuilder<NotificationsCubit, NotificationsState>(
              buildWhen: (previous, current) =>
                  current is NotificationsUnreadCountLoadedState,
              builder: (context, notificationsState) {
                final unreadCount = notificationsState
                        is NotificationsUnreadCountLoadedState
                    ? notificationsState.count
                    : context.read<NotificationsCubit>().unreadCount;

                final currentIdx = layoutCubit.currentIndex;

                return CustomBottomNavBar(
                  currentIndex: currentIdx,
                  onTap: (index) {
                    layoutCubit.changeTab(index);
                    if (index == _alertsTabIndex) {
                      context
                          .read<NotificationsCubit>()
                          .getUnreadNotificationsCount();
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/home_icon.svg',
                        width: 26,
                        height: 26,
                        colorFilter: ColorFilter.mode(
                          currentIdx == 0
                              ? const Color(0xFF0BD1ED)
                              : const Color(0xFFA0AAB2),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        currentIdx == 1 ? Icons.people : Icons.people_outline,
                        size: 26,
                        color: currentIdx == 1
                            ? const Color(0xFF0BD1ED)
                            : const Color(0xFFA0AAB2),
                      ),
                      label: 'Users',
                    ),
                    BottomNavigationBarItem(
                      icon: NotificationsNavIcon(
                        count: unreadCount,
                        isActive: currentIdx == 2,
                        size: 26,
                      ),
                      label: 'Alerts',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/images/user_icon.svg',
                        width: 26,
                        height: 26,
                        colorFilter: ColorFilter.mode(
                          currentIdx == 3
                              ? const Color(0xFF0BD1ED)
                              : const Color(0xFFA0AAB2),
                          BlendMode.srcIn,
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
