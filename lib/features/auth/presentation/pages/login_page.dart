import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';
import '../widgets/login_form_card.dart';
import '../widgets/login_header.dart';
import '../widgets/progress_dots.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = context.horizontalPadding;

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == LoginSubmissionStatus.success,
      listener: (context, state) {
        Navigator.of(context).pushReplacementNamed(AppRouter.home);
      },
      child: Scaffold(
        body: Stack(
          children: [
            const _AmbientBackground(),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalPadding,
                      24,
                      horizontalPadding,
                      0,
                    ),
                    child: const _BrandHeader(),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          32,
                          horizontalPadding,
                          24,
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 460),
                          child: Column(
                            children: const [
                              LoginHeader(),
                              SizedBox(height: 48),
                              LoginFormCard(),
                              SizedBox(height: 48),
                              _DisclaimerText(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 0, 24, 32),
                    child: ProgressDots(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.spa_rounded, size: 30, color: AppColors.primary),
        const SizedBox(width: 8),
        Text('Marg Darshak', style: context.textTheme.headlineMedium),
      ],
    );
  }
}

class _DisclaimerText extends StatelessWidget {
  const _DisclaimerText();

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 260),
      child: Text(
        'Not a replacement for therapy, medical, legal, or religious counseling.',
        textAlign: TextAlign.center,
        style: context.textTheme.labelMedium?.copyWith(
          fontSize: 12,
          letterSpacing: 2,
          color: AppColors.outline,
        ),
      ),
    );
  }
}

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(1.1, -1.0),
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26FCCC38),
                        blurRadius: 120,
                        spreadRadius: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-1.05, 1.05),
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer.withValues(alpha: 0.05),
                  shape: BoxShape.circle,
                ),
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x14442A22),
                        blurRadius: 100,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
