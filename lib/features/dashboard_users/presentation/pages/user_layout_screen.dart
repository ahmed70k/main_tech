import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:main_tech/core/utils/colors/app_colors.dart';
import 'package:main_tech/core/widgets/custom_bottom_nav_bar.dart';
import 'package:main_tech/di/di.dart';
import 'package:main_tech/features/notifications/presentation/manager/notifications_cubit.dart';
import 'package:main_tech/features/notifications/presentation/manager/notifications_state.dart';
import 'package:main_tech/features/notifications/presentation/pages/notifications_screen.dart';
import 'package:main_tech/features/notifications/presentation/widgets/notifications_nav_icon.dart';
import 'package:main_tech/features/dashboard_users/home/presentation/pages/user_home_screen.dart';
import 'package:main_tech/features/dashboard_users/presentation/manager/user_layout_cubit.dart';
import 'package:main_tech/features/dashboard_users/presentation/manager/user_layout_state.dart';
import 'package:main_tech/features/profile/presentation/pages/profile_screen.dart';
class UserLayoutScreen extends StatelessWidget {
  const UserLayoutScreen({super.key});
  static const int _alertsTabIndex = 1;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<NotificationsCubit>()..getUnreadNotificationsCount(),
        ),
        BlocProvider(create: (_) => getIt<UserLayoutCubit>()),
      ],
      child: BlocBuilder<UserLayoutCubit, UserLayoutState>(
        builder: (context, state) {
          final layoutCubit = context.read<UserLayoutCubit>();
          return Scaffold(
            backgroundColor: AppColors.background,
            body: IndexedStack(
              index: layoutCubit.currentIndex,
              children: const [
                UserHomeScreen(),
                NotificationsScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar:
                BlocBuilder<NotificationsCubit, NotificationsState>(
                  buildWhen: (previous, current) =>
                      current is NotificationsUnreadCountLoadedState,
                  builder: (context, notificationsState) {
                    final unreadCount =
                        notificationsState
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
                          icon: NotificationsNavIcon(
                            count: unreadCount,
                            isActive: currentIdx == 1,
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
                              currentIdx == 2
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
