import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_radii.dart';
import '../../core/extensions/context_extensions.dart';
import 'app_destination.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.activeDestination,
  });

  final AppDestination activeDestination;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D442A22),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (final destination in AppDestination.values)
              _BottomNavItem(
                destination: destination,
                isActive: destination == activeDestination,
              ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.destination,
    required this.isActive,
  });

  final AppDestination destination;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final iconColor = isActive
        ? AppColors.onSecondaryContainer
        : AppColors.onSurfaceVariant;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(isActive ? destination.selectedIcon : destination.icon, color: iconColor),
        const SizedBox(height: 4),
        Text(
          destination.label,
          style: context.textTheme.labelMedium?.copyWith(color: iconColor),
        ),
      ],
    );

    final child = isActive
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.secondaryContainer,
              borderRadius: BorderRadius.circular(AppRadii.full),
            ),
            child: content,
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: content,
          );

    return InkWell(
      onTap: isActive
          ? null
          : () => Navigator.of(context).pushReplacementNamed(destination.route),
      borderRadius: BorderRadius.circular(AppRadii.full),
      child: child,
    );
  }
}
