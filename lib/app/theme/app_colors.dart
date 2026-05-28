import 'package:flutter/material.dart';

final class AppColors {
  const AppColors._();

  static const Color surface = Color(0xFFFBFBE2);
  static const Color surfaceDim = Color(0xFFDBDCC3);
  static const Color surfaceBright = Color(0xFFFBFBE2);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF5F5DC);
  static const Color surfaceContainer = Color(0xFFEFEFD7);
  static const Color surfaceContainerHigh = Color(0xFFEAEAD1);
  static const Color surfaceContainerHighest = Color(0xFFE4E4CC);
  static const Color onSurface = Color(0xFF1B1D0E);
  static const Color onSurfaceVariant = Color(0xFF504441);
  static const Color inverseSurface = Color(0xFF303221);
  static const Color inverseOnSurface = Color(0xFFF2F2D9);
  static const Color outline = Color(0xFF827470);
  static const Color outlineVariant = Color(0xFFD4C3BE);
  static const Color surfaceTint = Color(0xFF77574D);
  static const Color primary = Color(0xFF442A22);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF5D4037);
  static const Color onPrimaryContainer = Color(0xFFD4ADA1);
  static const Color inversePrimary = Color(0xFFE7BDB1);
  static const Color secondary = Color(0xFF755B00);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFFCCC38);
  static const Color onSecondaryContainer = Color(0xFF6F5600);
  static const Color tertiary = Color(0xFF4E2700);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF6E3A00);
  static const Color onTertiaryContainer = Color(0xFFFEA049);
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);
  static const Color background = surface;
  static const Color onBackground = onSurface;
  static const Color surfaceVariant = Color(0xFFE4E4CC);
  static const Color clayAction = Color(0xFFCC7722);
  static const Color subtleGold = Color(0xFFD4AF37);

  static const ColorScheme scheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    onSurface: onSurface,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: Color(0x26000000),
    scrim: Color(0x52000000),
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    inversePrimary: inversePrimary,
  );
}
