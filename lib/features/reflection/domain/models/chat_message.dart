import 'package:flutter/material.dart';

enum MessageAuthor { guide, user }

final class ChatMessage {
  const ChatMessage({
    required this.author,
    required this.text,
    this.label,
    this.wisdomCard,
  });

  final MessageAuthor author;
  final String text;
  final String? label;
  final WisdomCardModel? wisdomCard;

  bool get isFromGuide => author == MessageAuthor.guide;
}

final class WisdomCardModel {
  const WisdomCardModel({
    required this.source,
    required this.quote,
    required this.description,
    this.icon = Icons.auto_stories_rounded,
  });

  final String source;
  final String quote;
  final String description;
  final IconData icon;
}
