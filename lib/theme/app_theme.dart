import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static const primaryFont = "Inter";

  static const headingStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w700,
    fontFamily: primaryFont,
    color: Color.fromRGBO(30, 31, 32, 1),
  );

  static const subtitleStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    fontFamily: primaryFont,
    color: Color.fromRGBO(124, 124, 124, 1),
  );

  static const vehicleTileText = TextStyle(
    color: AppColors.textColor,
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.32,
  );

  static const tileHeadingText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const tileGreenText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.iconsColor,
  );
  static const errorText = TextStyle(
    fontSize: 12,
    fontFamily: AppTheme.primaryFont,
    fontWeight: FontWeight.w500,
    color: AppColors.errorMessageTextColor,
  );
  const AppTheme();
}
