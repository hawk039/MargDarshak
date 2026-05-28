final class ReflectionSummary {
  const ReflectionSummary({
    required this.dateLabel,
    required this.category,
    required this.title,
    required this.description,
    this.isFeatured = false,
  });

  final String dateLabel;
  final String category;
  final String title;
  final String description;
  final bool isFeatured;
}
