import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/navigation/app_bottom_nav.dart';
import '../../../../shared/navigation/app_destination.dart';
import '../../../../shared/navigation/app_shell_header.dart';
import '../../domain/models/settings_option.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const List<SettingsOption> _options = [
    SettingsOption(icon: Icons.info_outline, label: 'About Marg Darshak'),
    SettingsOption(icon: Icons.gavel_rounded, label: 'Disclaimer'),
    SettingsOption(icon: Icons.shield_outlined, label: 'Privacy Policy'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: context.isCompact
          ? const AppBottomNav(activeDestination: AppDestination.settings)
          : null,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const AppShellHeader(activeDestination: AppDestination.settings),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  context.horizontalPadding,
                  24,
                  context.horizontalPadding,
                  context.isCompact ? 120 : 36,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        _ProfileSection(),
                        SizedBox(height: 40),
                        _SettingsList(options: _options),
                        SizedBox(height: 40),
                        _ActionSection(),
                        SizedBox(height: 48),
                        _VersionFooter(),
                      ],
                    ),
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

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.subtleGold.withValues(alpha: 0.2)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x14442A22),
                blurRadius: 18,
                offset: Offset(0, 6),
              ),
            ],
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF4E6D1), Color(0xFFD6BA9B)],
            ),
          ),
          child: const Icon(Icons.person_rounded, size: 48, color: AppColors.primary),
        ),
        const SizedBox(height: 24),
        Text('Aditya Sharma', style: context.textTheme.headlineLarge),
        const SizedBox(height: 4),
        Text(
          'aditya.sharma@example.com',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _SettingsList extends StatelessWidget {
  const _SettingsList({required this.options});

  final List<SettingsOption> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: AppColors.subtleGold.withValues(alpha: 0.1)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A442A22),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          for (var index = 0; index < options.length; index++) ...[
            _SettingsRow(option: options[index]),
            if (index != options.length - 1)
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                color: AppColors.outlineVariant.withValues(alpha: 0.3),
              ),
          ],
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.option});

  final SettingsOption option;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Icon(option.icon, color: AppColors.primary.withValues(alpha: 0.7)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(option.label, style: context.textTheme.bodyLarge),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.outlineVariant),
          ],
        ),
      ),
    );
  }
}

class _ActionSection extends StatelessWidget {
  const _ActionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ActionButton(
          icon: Icons.history_toggle_off_rounded,
          label: 'Delete history',
          foreground: AppColors.onSurfaceVariant,
          background: AppColors.surfaceContainerHighest.withValues(alpha: 0.5),
          border: AppColors.outlineVariant.withValues(alpha: 0.2),
        ),
        const SizedBox(height: 16),
        _ActionButton(
          icon: Icons.logout_rounded,
          label: 'Logout',
          foreground: AppColors.tertiary,
          background: AppColors.tertiaryContainer.withValues(alpha: 0.1),
          border: AppColors.tertiary.withValues(alpha: 0.2),
          onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.login,
            (route) => false,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.foreground,
    required this.background,
    required this.border,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color foreground;
  final Color background;
  final Color border;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(AppRadii.xl),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [
            Icon(icon, color: foreground),
            const SizedBox(width: 16),
            Text(
              label,
              style: context.textTheme.labelMedium?.copyWith(color: foreground),
            ),
          ],
        ),
      ),
    );
  }
}

class _VersionFooter extends StatelessWidget {
  const _VersionFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Marg Darshak Version 2.4.0',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.outline,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          'Handcrafted for your inner peace.',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.outline,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
