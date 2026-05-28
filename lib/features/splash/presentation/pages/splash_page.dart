import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../widgets/splash_progress_dots.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _goToLogin);
  }

  void _goToLogin() {
    if (!mounted) {
      return;
    }

    Navigator.of(context).pushReplacementNamed(AppRouter.login);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _WarmGradientBackground(),
          const _AmbientBlurs(),
          const _TextureOverlay(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.horizontalPadding),
              child: Column(
                children: [
                  const Spacer(),
                  const _IdentityCluster(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 56),
                    child: const SplashProgressDots(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IdentityCluster extends StatelessWidget {
  const _IdentityCluster();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 148,
          height: 168,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondary.withValues(alpha: 0.2),
                  ),
                ),
              ),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondary.withValues(alpha: 0.1),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1AF4C430),
                      blurRadius: 80,
                      spreadRadius: 20,
                    ),
                    BoxShadow(
                      color: Color(0x14442A22),
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.spa_outlined,
                  size: 48,
                  color: context.colors.secondary,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 1,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.secondary.withValues(alpha: 0.4),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Text(
          'Marg Darshak',
          textAlign: TextAlign.center,
          style: context.textTheme.displayLarge,
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
          child: Text(
            "'A calm companion for inner reflection'",
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium?.copyWith(
              fontSize: 22,
              height: 32 / 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _WarmGradientBackground extends StatelessWidget {
  const _WarmGradientBackground();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            AppColors.surface,
            AppColors.surfaceContainer,
          ],
        ),
      ),
      child: SizedBox.expand(),
    );
  }
}

class _AmbientBlurs extends StatelessWidget {
  const _AmbientBlurs();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFF0C12C).withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1AF0C12C),
                      blurRadius: 120,
                      spreadRadius: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: -80,
            bottom: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFFE7BDB1).withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1AE7BDB1),
                      blurRadius: 120,
                      spreadRadius: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextureOverlay extends StatelessWidget {
  const _TextureOverlay();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: 0.03,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary.withValues(alpha: 0.12),
                Colors.transparent,
                AppColors.secondary.withValues(alpha: 0.08),
              ],
            ),
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}
