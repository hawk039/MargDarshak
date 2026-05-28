import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/navigation/app_bottom_nav.dart';
import '../../../../shared/navigation/app_destination.dart';
import '../../../../shared/navigation/app_shell_header.dart';
import '../../domain/models/chat_message.dart';
import '../widgets/chat_bubble.dart';

class ReflectionPage extends StatelessWidget {
  const ReflectionPage({super.key});

  static const List<ChatMessage> _messages = [
    ChatMessage(
      author: MessageAuthor.guide,
      text:
          'Welcome back to your sanctuary. Take a deep breath. How are you feeling about the transitions you mentioned yesterday?',
    ),
    ChatMessage(
      author: MessageAuthor.user,
      text:
          "I'm feeling a bit overwhelmed by the expectations at work. I feel like I'm constantly chasing results and losing my peace.",
    ),
    ChatMessage(
      author: MessageAuthor.guide,
      text:
          'The weight of expectations often stems from our attachment to outcomes we cannot fully control. This is a timeless challenge for the human spirit. Perhaps this perspective can offer some light:',
      wisdomCard: WisdomCardModel(
        source: 'Bhagavad Gita — Chapter 2',
        quote: 'Focus on action, not attachment to results.',
        description:
            'When we decouple our worth from the final outcome, our work becomes a form of meditation rather than a source of anxiety.',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: context.isCompact
          ? const AppBottomNav(activeDestination: AppDestination.reflect)
          : null,
      body: Stack(
        children: [
          const _ReflectionBackground(),
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const AppShellHeader(activeDestination: AppDestination.reflect),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 960),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          context.horizontalPadding,
                          24,
                          context.horizontalPadding,
                          context.isCompact ? 132 : 36,
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.separated(
                                      padding: const EdgeInsets.only(bottom: 120),
                                      itemCount: _messages.length,
                                      separatorBuilder: (_, __) => const SizedBox(height: 32),
                                      itemBuilder: (context, index) =>
                                          ChatBubble(message: _messages[index]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const _BreathingIndicator(),
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: ReflectionInputBar(),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class ReflectionInputBar extends StatelessWidget {
  const ReflectionInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(AppRadii.full),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A442A22),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle_outline, color: AppColors.outline),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Share what\'s on your mind...',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.outlineVariant,
                ),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.tertiary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded, color: Colors.white, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class _BreathingIndicator extends StatelessWidget {
  const _BreathingIndicator();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 88,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0x66F4C430),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66F4C430),
                      blurRadius: 22,
                      spreadRadius: 8,
                    ),
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0x99F4C430),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReflectionBackground extends StatelessWidget {
  const _ReflectionBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ColoredBox(color: AppColors.surface),
        Positioned(
          top: 80,
          left: 20,
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1AF4C430),
                    blurRadius: 120,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 40,
          bottom: 140,
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.tertiary.withValues(alpha: 0.05),
              shape: BoxShape.circle,
            ),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x144E2700),
                    blurRadius: 100,
                    spreadRadius: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
