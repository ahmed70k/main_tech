import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';
import '../utils/styles/app_styles.dart';

class AppDialogs {
  static bool _isLoadingShown = false;

  /// LOADING
  static void showLoading(BuildContext context) {
    if (_isLoadingShown) return;

    _isLoadingShown = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: AppColors.textPrimary),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    if (!_isLoadingShown) return;

    _isLoadingShown = false;

    Navigator.of(context, rootNavigator: true).pop();
  }

  /// SUCCESS
  static Future<void> showSuccess(
    BuildContext context, {
    required String message,
    String title = "Success",
  }) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: AppStyles.textLinkStyle),
          ),
        ],
      ),
    );
  }

  /// ERROR
  static Future<void> showError(
    BuildContext context, {
    required String message,
    String title = "Error",
  }) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: AppStyles.textLinkStyle),
          ),
        ],
      ),
    );
  }

  /// CONFIRMATION
  static Future<bool?> showConfirmation(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel", style: AppStyles.textLinkStyle),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Confirm", style: AppStyles.textLinkStyle),
          ),
        ],
      ),
    );
  }
}
