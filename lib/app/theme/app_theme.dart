import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_radii.dart';

final class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final baseTextTheme = ThemeData.light(useMaterial3: true).textTheme;

    final textTheme = GoogleFonts.manropeTextTheme(baseTextTheme).copyWith(
      displayLarge: GoogleFonts.ebGaramond(
        fontSize: 48,
        height: 56 / 48,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.96,
        color: AppColors.primary,
      ),
      headlineLarge: GoogleFonts.ebGaramond(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      ),
      headlineMedium: GoogleFonts.ebGaramond(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 18,
        height: 28 / 18,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
      ),
      labelMedium: GoogleFonts.manrope(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.7,
        color: AppColors.onSurfaceVariant,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.scheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: textTheme,
      canvasColor: AppColors.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.primary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.headlineMedium,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: const BorderSide(color: AppColors.outlineVariant),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: const BorderSide(color: AppColors.outlineVariant),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: const BorderSide(color: AppColors.secondary, width: 1.4),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
          borderSide: const BorderSide(color: AppColors.error, width: 1.4),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.outlineVariant,
        ),
        labelStyle: textTheme.labelMedium,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.clayAction,
          foregroundColor: AppColors.onPrimary,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.full),
          ),
          textStyle: textTheme.labelMedium,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.onSurfaceVariant,
          backgroundColor: AppColors.surfaceContainerHighest,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.full),
          ),
          side: BorderSide(
            color: AppColors.outlineVariant.withValues(alpha: 0.3),
          ),
          textStyle: textTheme.labelMedium,
        ),
      ),
    );
  }
}
