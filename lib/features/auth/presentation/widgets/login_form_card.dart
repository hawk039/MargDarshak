import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';
import 'google_sign_in_button.dart';

class LoginFormCard extends StatelessWidget {
  const LoginFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.isCompact ? 32 : 40),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        border: Border.all(color: AppColors.subtleGold.withValues(alpha: 0.1)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26442A22),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FieldGroup(
                label: 'Email Address',
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  initialValue: state.email,
                  onChanged: cubit.emailChanged,
                  decoration: const InputDecoration(
                    hintText: 'name@example.com',
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _FieldGroup(
                label: 'Password',
                trailing: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: context.colors.secondary,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size.zero,
                  ),
                  child: const Text('Forgot password?'),
                ),
                child: TextFormField(
                  obscureText: true,
                  initialValue: state.password,
                  onChanged: cubit.passwordChanged,
                  decoration: const InputDecoration(hintText: '••••••••'),
                ),
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                onPressed: state.canSubmit ? cubit.submit : null,
                child: state.isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Sign In'),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.outlineVariant),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'OR',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.outline,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.outlineVariant),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const GoogleSignInButton(),
              const SizedBox(height: 32),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  children: const [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: 'Create Journey',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FieldGroup extends StatelessWidget {
  const _FieldGroup({required this.label, required this.child, this.trailing});

  final String label;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(label, style: context.textTheme.labelMedium),
              ),
            ),
            if (trailing case final trailingWidget?) trailingWidget,
          ],
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}
