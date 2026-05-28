import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class ProgressDots extends StatelessWidget {
  const ProgressDots({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Dot(color: AppColors.secondaryContainer),
        SizedBox(width: 12),
        _Dot(color: AppColors.outlineVariant),
        SizedBox(width: 12),
        _Dot(color: AppColors.outlineVariant),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
