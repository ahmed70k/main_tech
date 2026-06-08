import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';

class AppDialogs {
  static bool _isLoadingShown = false;

  /// LOADING
  static void showLoading(BuildContext context) {
    if (_isLoadingShown) return;

    _isLoadingShown = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cardBorderColor, width: 1.5),
          ),
          child: const CircularProgressIndicator(
            color: Color(0xFF0BD1ED),
          ),
        ),
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
      builder: (dialogContext) => _CustomDialog(
        title: title,
        message: message,
        icon: Icons.check_circle_outline_rounded,
        iconColor: const Color(0xFF00E676),
        actions: [
          _DialogButton(
            text: "OK",
            textColor: const Color(0xFF0BD1ED),
            backgroundColor: const Color(0xFF143D4B),
            borderColor: const Color(0xFF0BD1ED).withValues(alpha: 0.3),
            onPressed: () => Navigator.pop(dialogContext),
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
      builder: (dialogContext) => _CustomDialog(
        title: title,
        message: message,
        icon: Icons.error_outline_rounded,
        iconColor: const Color(0xFFFF5252),
        actions: [
          _DialogButton(
            text: "OK",
            textColor: const Color(0xFFFF5252),
            backgroundColor: const Color(0xFF4A2529),
            borderColor: const Color(0xFFFF5252).withValues(alpha: 0.3),
            onPressed: () => Navigator.pop(dialogContext),
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
    final isDestructive = title.contains('حذف') ||
        title.toLowerCase().contains('delete') ||
        message.contains('حذف') ||
        message.toLowerCase().contains('delete');

    final confirmColor = isDestructive ? const Color(0xFFFF5252) : const Color(0xFF0BD1ED);
    final confirmBg = isDestructive ? const Color(0xFF4A2529) : const Color(0xFF143D4B);

    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => _CustomDialog(
        title: title,
        message: message,
        icon: Icons.help_outline_rounded,
        iconColor: const Color(0xFF0BD1ED),
        actions: [
          _DialogButton(
            text: "Cancel",
            textColor: AppColors.textSecondary,
            backgroundColor: Colors.transparent,
            borderColor: AppColors.cardBorderColor,
            onPressed: () => Navigator.pop(dialogContext, false),
          ),
          _DialogButton(
            text: "Confirm",
            textColor: confirmColor,
            backgroundColor: confirmBg,
            borderColor: confirmColor.withValues(alpha: 0.3),
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
        ],
      ),
    );
  }
}

class _CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color iconColor;
  final List<Widget> actions;

  const _CustomDialog({
    required this.title,
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.cardBorderColor,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 32,
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            // Actions
            Row(
              children: [
                for (int i = 0; i < actions.length; i++) ...[
                  if (i > 0) const SizedBox(width: 12),
                  Expanded(child: actions[i]),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const _DialogButton({
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
