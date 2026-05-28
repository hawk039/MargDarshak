import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../domain/models/reflection_summary.dart';

class ReflectionCard extends StatelessWidget {
  const ReflectionCard({
    super.key,
    required this.reflection,
  });

  final ReflectionSummary reflection;

  @override
  Widget build(BuildContext context) {
    final content = reflection.isFeatured
        ? _FeaturedReflectionCard(reflection: reflection)
        : _StandardReflectionCard(reflection: reflection);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCF4),
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(
          color: AppColors.subtleGold.withValues(alpha: 0.2),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D442A22),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: content,
    );
  }
}

class _StandardReflectionCard extends StatelessWidget {
  const _StandardReflectionCard({required this.reflection});

  final ReflectionSummary reflection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardMetaRow(reflection: reflection),
          const SizedBox(height: 16),
          Text(reflection.title, style: context.textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            reflection.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedReflectionCard extends StatelessWidget {
  const _FeaturedReflectionCard({required this.reflection});

  final ReflectionSummary reflection;

  @override
  Widget build(BuildContext context) {
    final isCompact = context.isCompact;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ReflectionArtwork(),
                const SizedBox(height: 20),
                _FeaturedContent(reflection: reflection),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 1,
                  child: _ReflectionArtwork(),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 2,
                  child: _FeaturedContent(reflection: reflection),
                ),
              ],
            ),
    );
  }
}

class _FeaturedContent extends StatelessWidget {
  const _FeaturedContent({required this.reflection});

  final ReflectionSummary reflection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CardMetaRow(reflection: reflection),
        const SizedBox(height: 16),
        Text(reflection.title, style: context.textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(
          reflection.description,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _CardMetaRow extends StatelessWidget {
  const _CardMetaRow({required this.reflection});

  final ReflectionSummary reflection;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            reflection.dateLabel,
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.outline,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(AppRadii.full),
          ),
          child: Text(
            reflection.category,
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _ReflectionArtwork extends StatelessWidget {
  const _ReflectionArtwork();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadii.lg),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFEFE7D5),
                Color(0xFFD9CCB2),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 18,
                left: 28,
                right: 28,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCEC0A2).withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              Positioned(
                left: 54,
                bottom: 46,
                child: Container(
                  width: 2,
                  height: 48,
                  color: AppColors.subtleGold.withValues(alpha: 0.9),
                ),
              ),
              Positioned(
                left: 50,
                bottom: 88,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
