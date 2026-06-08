import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:main_tech/config/app_routes/app_routes.dart';
import 'package:main_tech/features/auth/login/presentation/pages/login_screen.dart';
import 'package:main_tech/features/auth/send_otp/presentation/pages/send_otp_screen.dart';
import 'package:main_tech/features/auth/reset_password/presentation/pages/reset_password_screen.dart';

import 'core/utils/bloc_observer/bloc_observer.dart';
import 'core/utils/colors/app_colors.dart';
import 'di/di.dart';
import 'features/auth/register/presentation/pages/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
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
        AppRoutes.register: (_) => const RegisterView(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.sendOtp: (_) => const SendOtpScreen(),
        AppRoutes.resetPassword: (_) => const ResetPasswordScreen(),
      },
    );
  }
}
