import 'package:flutter/material.dart';

import '../../app/router/app_router.dart';

enum AppDestination {
  sanctuary(
    label: 'Sanctuary',
    icon: Icons.home_work_rounded,
    selectedIcon: Icons.home_work_rounded,
    route: AppRouter.home,
  ),
  reflect(
    label: 'Reflect',
    icon: Icons.auto_awesome_outlined,
    selectedIcon: Icons.auto_awesome_rounded,
    route: AppRouter.reflection,
  ),
  settings(
    label: 'Settings',
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
    route: AppRouter.settings,
  );

  const AppDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String route;
}
