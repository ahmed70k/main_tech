import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:main_tech/config/app_routes/app_routes.dart';
import 'package:main_tech/features/admin/subscriptions_plans/presentation/pages/admin_subscriptions_plans_screen.dart';
import 'package:main_tech/features/auth/login/presentation/pages/login_screen.dart';
import 'package:main_tech/features/auth/send_otp/presentation/pages/send_otp_screen.dart';
import 'package:main_tech/features/auth/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:main_tech/features/admin/presentation/pages/admin_layout_screen.dart';
import 'package:main_tech/features/dashboard_users/presentation/pages/user_layout_screen.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'di/di.dart';
import 'features/auth/register/presentation/pages/register_view.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.transparent,
          cursorColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.adminLayout: (_) => const AdminLayoutScreen(),
        AppRoutes.userLayout: (_) => const UserLayoutScreen(),
        AppRoutes.register: (_) => const RegisterView(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.sendOtp: (_) => const SendOtpScreen(),
        AppRoutes.resetPassword: (_) => const ResetPasswordScreen(),
        AppRoutes.subscriptionPlan: (_) => const AdminSubscriptionsPlansScreen(),
      },
    );
  }
}
