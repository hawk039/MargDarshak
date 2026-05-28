import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.isCompact
        ? context.textTheme.headlineLarge?.copyWith(
            fontSize: 28,
            height: 36 / 28,
          )
        : context.textTheme.displayLarge;

    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: context.colors.secondaryContainer,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0x26F4C430),
                blurRadius: 40,
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.onSecondaryContainer,
            size: 32,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Begin your journey inward',
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Text(
            'Step away from the noise and find clarity within.',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
