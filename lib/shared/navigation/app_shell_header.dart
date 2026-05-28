import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/extensions/context_extensions.dart';
import 'app_destination.dart';

class AppShellHeader extends StatelessWidget {
  const AppShellHeader({
    super.key,
    required this.activeDestination,
    this.trailing,
  });

  final AppDestination activeDestination;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding,
        vertical: 16,
      ),
      color: AppColors.surface,
      child: Row(
        children: [
          const Icon(Icons.spa_rounded, color: AppColors.primary),
          const SizedBox(width: 12),
          Text('Marg Darshak', style: context.textTheme.headlineMedium),
          const Spacer(),
          if (!context.isCompact) ...[
            for (final destination in AppDestination.values) ...[
              _HeaderNavItem(
                destination: destination,
                isActive: destination == activeDestination,
              ),
              if (destination != AppDestination.values.last) const SizedBox(width: 32),
            ],
            const SizedBox(width: 24),
          ],
          trailing ??
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
        ],
      ),
    );
  }
}

class _HeaderNavItem extends StatelessWidget {
  const _HeaderNavItem({
    required this.destination,
    required this.isActive,
  });

  final AppDestination destination;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive
          ? null
          : () => Navigator.of(context).pushReplacementNamed(destination.route),
      borderRadius: BorderRadius.circular(999),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Text(
          destination.label,
          style: context.textTheme.labelMedium?.copyWith(
            color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
