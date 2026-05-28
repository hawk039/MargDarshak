import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/navigation/app_bottom_nav.dart';
import '../../../../shared/navigation/app_destination.dart';
import '../../../../shared/navigation/app_shell_header.dart';
import '../../domain/models/reflection_summary.dart';
import '../widgets/reflection_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<ReflectionSummary> _reflections = [
    ReflectionSummary(
      dateLabel: 'Oct 24, 2023',
      category: 'Career',
      title: 'Career confusion',
      description:
          'Explored the tension between financial stability and creative passion. Found a middle path involving gradual transition.',
    ),
    ReflectionSummary(
      dateLabel: 'Oct 20, 2023',
      category: 'Mindset',
      title: 'Overthinking',
      description:
          "Deconstructed the cycle of rumination regarding social interactions. AI suggested the 'Five Breath' grounding technique.",
    ),
    ReflectionSummary(
      dateLabel: 'Oct 15, 2023',
      category: 'Growth',
      title: 'Fear of failure',
      description:
          'Dived deep into the origins of perfectionism. Realized that fear is often a sign of caring deeply about the outcome. Redefined failure as a necessary data point for growth.',
      isFeatured: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: context.isCompact
          ? const AppBottomNav(activeDestination: AppDestination.sanctuary)
          : null,
      body: Stack(
        children: [
          const _HomeBackground(),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const AppShellHeader(activeDestination: AppDestination.sanctuary),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(
                      context.horizontalPadding,
                      24,
                      context.horizontalPadding,
                      context.isCompact ? 120 : 64,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 960),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _HeroSection(),
                          const SizedBox(height: 48),
                          _PreviousReflectionsSection(reflections: _reflections),
                          const SizedBox(height: 48),
                          const _FooterDots(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (context.isCompact) const _BreathingIndicator(),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'What needs your reflection today?',
          textAlign: TextAlign.center,
          style: context.textTheme.displayLarge,
        ),
        const SizedBox(height: 8),
        Text(
          'Take a breath. Step into your inner sanctuary.',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 48),
        const _StartReflectionCard(),
      ],
    );
  }
}

class _StartReflectionCard extends StatelessWidget {
  const _StartReflectionCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushReplacementNamed(AppRouter.reflection),
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.secondaryContainer.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(999),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x26FCCC38),
                  blurRadius: 48,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(AppRadii.xl),
              border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.spa_rounded,
                    size: 36,
                    color: AppColors.onSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                Text('Start Reflection', style: context.textTheme.headlineLarge),
                const SizedBox(height: 8),
                Text(
                  'Begin a guided journey',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreviousReflectionsSection extends StatelessWidget {
  const _PreviousReflectionsSection({required this.reflections});

  final List<ReflectionSummary> reflections;

  @override
  Widget build(BuildContext context) {
    final standardReflections = reflections.where((item) => !item.isFeatured).toList();
    final featuredReflection = reflections.firstWhere((item) => item.isFeatured);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Previous Reflections',
                style: context.textTheme.headlineMedium,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View Archive',
                    style: context.textTheme.labelMedium?.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (context.isCompact) ...[
          for (final reflection in standardReflections) ...[
            ReflectionCard(reflection: reflection),
            const SizedBox(height: 16),
          ],
          ReflectionCard(reflection: featuredReflection),
        ] else ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var index = 0; index < standardReflections.length; index++) ...[
                Expanded(
                  child: ReflectionCard(reflection: standardReflections[index]),
                ),
                if (index != standardReflections.length - 1) const SizedBox(width: 16),
              ],
            ],
          ),
          const SizedBox(height: 16),
          ReflectionCard(reflection: featuredReflection),
        ],
      ],
    );
  }
}

class _FooterDots extends StatelessWidget {
  const _FooterDots();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        3,
        (index) => Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: const BoxDecoration(
            color: AppColors.secondaryContainer,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BreathingIndicator extends StatelessWidget {
  const _BreathingIndicator();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24,
      bottom: 104,
      child: IgnorePointer(
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.secondary.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _HomeBackground extends StatelessWidget {
  const _HomeBackground();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.surface,
            AppColors.surface.withValues(alpha: 0.98),
          ],
        ),
      ),
      child: const SizedBox.expand(),
    );
  }
}
