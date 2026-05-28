import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../domain/models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isGuide = message.isFromGuide;
    final bubbleColor = isGuide
        ? AppColors.surfaceContainerLow
        : AppColors.secondaryContainer;
    final textColor = isGuide
        ? AppColors.onSurface
        : AppColors.onSecondaryContainer;

    return Align(
      alignment: isGuide ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: context.isCompact ? 320 : 520),
        child: Column(
          crossAxisAlignment:
              isGuide ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadii.xl),
                  topRight: Radius.circular(AppRadii.xl),
                  bottomLeft: Radius.circular(isGuide ? AppRadii.md : AppRadii.xl),
                  bottomRight: Radius.circular(isGuide ? AppRadii.xl : AppRadii.md),
                ),
                border: Border.all(
                  color: isGuide
                      ? AppColors.subtleGold.withValues(alpha: 0.1)
                      : AppColors.secondary.withValues(alpha: 0.2),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0D442A22),
                    blurRadius: 20,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: textColor,
                  height: 1.55,
                ),
              ),
            ),
            if (message.wisdomCard != null) ...[
              const SizedBox(height: 24),
              WisdomReferenceCard(card: message.wisdomCard!),
            ],
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(
                left: isGuide ? 8 : 0,
                right: isGuide ? 0 : 8,
              ),
              child: Text(
                message.label ?? (isGuide ? 'Marg Darshak' : 'Reflection'),
                style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.outline,
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WisdomReferenceCard extends StatelessWidget {
  const WisdomReferenceCard({
    super.key,
    required this.card,
  });

  final WisdomCardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: AppColors.subtleGold.withValues(alpha: 0.2)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -12,
            right: -20,
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(card.icon, size: 20, color: AppColors.clayAction),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      card.source,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.tertiary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                card.quote,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontSize: 22,
                  height: 32 / 22,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                card.description,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.outline,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
