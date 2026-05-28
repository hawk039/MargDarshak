import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class SplashProgressDots extends StatelessWidget {
  const SplashProgressDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        3,
        (index) => Padding(
          padding: EdgeInsets.only(right: index == 2 ? 0 : 16),
          child: Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: index == 0
                  ? AppColors.secondary.withValues(alpha: 0.6)
                  : AppColors.secondary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
