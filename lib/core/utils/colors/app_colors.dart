import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation
  // Background
  static const Color background = Color(0xFF171923); // Dark Navy/Gray

  // Primary Colors (Cyan/Blue)
  static const Color primaryCyan = Color(0xFF13C7E8);
  static const Color textCyan = Color(0xFF0BD1ED);
  static const Color micCardGradientStart = Color(0xFF29B6F6);
  static const Color micCardGradientEnd = Color(0xFF0277BD);

  static const Color excelCardGradientStart = Color(0xFF00C896); // Green/Teal
  static const Color excelCardGradientEnd = Color(0xFF0BD1ED); // Cyan

  static const Color premiumCardGradientStart = Color(0xFFFFB74D); // Yellow/Orange
  static const Color premiumCardGradientEnd = Color(0xFFFF5252); // Orange/Red
  
  static const Color cardBackground = Color(0xFF2D323E); // Form container background
  static const Color inputBackground = Color(0xFF222630); // Text field background

  // Headers and Banners
  static const Color topHeaderBackground = Color(0xFF1E3B8B); // Dark blue header
  static const Color premiumBannerBackground = Color(0xFF5A527A); // Purplish banner
  static const Color bannerIconBackground = Color(0xFF816155); // Orange/Brown icon bg
  static const Color headerInputBackground = Color(0xFF2B449A); // Translucent blue input bg

  // Cards and Borders
  static const Color cardBorderColor = Color(0xFF3A4150); // Subtle border for chips/cards
  static const Color iconBackgroundCyan = Color(0xFF143D4B); // Background for clock icon
  static const Color iconBackgroundTeal = Color(0xFF264B53); // Upload file icon bg
  static const Color iconBackgroundGreen = Color(0xFF1B3B2E); // Completed file icon bg
  static const Color iconBackgroundYellow = Color(0xFF4A3C22); // Processing file icon bg

  // Status Badges
  static const Color badgeHighBg = Color(0xFF123C2A);
  static const Color badgeHighText = Color(0xFF00E676);
  static const Color badgeMediumBg = Color(0xFF4B3B15);
  static const Color badgeMediumText = Color(0xFFFFC107);

  // Notifications
  static const Color tabRedBg = Color(0xFF3D2D38);
  static const Color tabRedBorder = Color(0xFFD32F2F);
  static const Color tabRedText = Color(0xFFD32F2F);
  static const Color badgeHighPriorityBg = Color(0xFF5C3A3F);
  static const Color badgeHighPriorityText = Color(0xFFE57373);

  // Profile
  static const Color avatarBackground = Color(0xFF13C7E8);
  static const Color pillBackgroundBlue = Color(0xFF1E528E);
  static const Color logoutButtonBackground = Color(0xFF4A2529);

  // Text Colors (Added)
  static const Color textYellow = Color(0xFFFFD54F); // For '23 days' and 'Upgrade'
  static const Color textBlue = Color(0xFF40C4FF); // For User Name
  static const Color textGreen = Color(0xFF00E676); // For Matches count
  static const Color textRed = Color(0xFFFF5252); // For Logout text
  
  // Navigation
  static const Color navBarBackground = Color(0xFF1C1E24);
  static const Color navBarActiveBackground = Color(0xFF0D3B4A);
  
  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFA0AAB2);
  static const Color textSkip = Color(0xFF8D959D);

  // Other UI Elements
  static const Color inactiveDot = Color(0xFF464E59);
}
