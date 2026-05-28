import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marg_darshak/app/theme/app_colors.dart';
import 'package:marg_darshak/features/auth/presentation/bloc/login_cubit.dart';
import 'package:marg_darshak/features/auth/presentation/pages/login_page.dart';
import 'package:marg_darshak/features/home/presentation/pages/home_page.dart';
import 'package:marg_darshak/features/reflection/presentation/pages/reflection_page.dart';
import 'package:marg_darshak/features/settings/presentation/pages/settings_page.dart';
import 'package:marg_darshak/features/splash/presentation/pages/splash_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> pumpPreview(
    WidgetTester tester, {
    required Widget child,
    required String goldenName,
  }) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(560, 1210);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _previewTheme(),
        home: child,
      ),
    );
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('goldens/$goldenName'),
    );
  }

  testWidgets('splash preview', (tester) async {
    await pumpPreview(
      tester,
      child: const SplashPage(),
      goldenName: 'splash_preview.png',
    );
  });

  testWidgets('login preview', (tester) async {
    await pumpPreview(
      tester,
      child: BlocProvider(
        create: (_) => LoginCubit(),
        child: const LoginPage(),
      ),
      goldenName: 'login_preview.png',
    );
  });

  testWidgets('home preview', (tester) async {
    await pumpPreview(
      tester,
      child: const HomePage(),
      goldenName: 'home_preview.png',
    );
  });

  testWidgets('reflection preview', (tester) async {
    await pumpPreview(
      tester,
      child: const ReflectionPage(),
      goldenName: 'reflection_preview.png',
    );
  });

  testWidgets('settings preview', (tester) async {
    await pumpPreview(
      tester,
      child: const SettingsPage(),
      goldenName: 'settings_preview.png',
    );
  });
}

ThemeData _previewTheme() {
  const serif = TextStyle();
  const sans = TextStyle();

  return ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.scheme,
    scaffoldBackgroundColor: AppColors.background,
    canvasColor: AppColors.surface,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 48,
        height: 56 / 48,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.96,
        color: AppColors.primary,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        height: 28 / 18,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.7,
        color: AppColors.onSurfaceVariant,
      ),
    ).apply(
      bodyColor: AppColors.onSurface,
      displayColor: AppColors.primary,
    ).copyWith(
      displayLarge: serif.merge(const TextStyle(
        fontSize: 48,
        height: 56 / 48,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.96,
        color: AppColors.primary,
      )),
      headlineLarge: serif.merge(const TextStyle(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      )),
      headlineMedium: serif.merge(const TextStyle(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      )),
      bodyLarge: sans.merge(const TextStyle(
        fontSize: 18,
        height: 28 / 18,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
      )),
      bodyMedium: sans.merge(const TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onSurface,
      )),
      labelMedium: sans.merge(const TextStyle(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.7,
        color: AppColors.onSurfaceVariant,
      )),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      foregroundColor: AppColors.primary,
      surfaceTintColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintStyle: const TextStyle(color: AppColors.outlineVariant),
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.onSurfaceVariant,
      ),
    ),
  );
}
