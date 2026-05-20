import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppStyles {
  AppStyles._(); // Private constructor to prevent instantiation

  // Title text (e.g. "Voice-First Search")
  static const TextStyle titleStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Subtitle text (Arabic cyan text)
  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textCyan,
  );

  // Body text
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Skip button text
  static const TextStyle skipButtonStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSkip,
  );

  // Next button text
  static const TextStyle nextButtonStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Input label text (e.g. "Email", "Password")
  static const TextStyle inputLabelStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Input hint text
  static const TextStyle inputHintStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // Text link (e.g. "Forgot password?", "Register")
  static const TextStyle textLinkStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryCyan,
  );

  // Footer text
  static const TextStyle footerStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  // User name in header
  static const TextStyle userNameStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlue,
  );

  // Banner titles (e.g. Premium Active)
  static const TextStyle bannerTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Banner highlighted text (e.g. Upgrade, 23 days)
  static const TextStyle bannerHighlightStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textYellow,
  );

  // Bottom Nav labels
  static const TextStyle navBarActiveStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryCyan,
  );

  static const TextStyle navBarInactiveStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  // Back button text
  static const TextStyle backButtonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Header input hint
  static const TextStyle headerInputHintStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Color(0xFF8C9EFF), // Light blue hint
  );

  // Section titles (e.g. Popular Searches)
  static const TextStyle sectionTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Chip text / List item titles
  static const TextStyle chipTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Badge text (High)
  static const TextStyle badgeHighStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.badgeHighText,
  );

  // Badge text (Medium)
  static const TextStyle badgeMediumStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.badgeMediumText,
  );

  // Stat values (e.g. 1,234)
  static const TextStyle statValueStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Matches value (e.g. 45)
  static const TextStyle statMatchesStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textGreen,
  );

  // Red Tab Text
  static const TextStyle tabRedTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.tabRedText,
  );

  // High Priority Badge Text
  static const TextStyle badgeHighPriorityStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.badgeHighPriorityText,
  );

  // Stat Large values (e.g. 156 on profile)
  static const TextStyle statLargeValueStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Logout button text
  static const TextStyle logoutButtonStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textRed,
  );
}
