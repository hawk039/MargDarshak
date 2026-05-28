import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  bool get isCompact => MediaQuery.sizeOf(this).width < 600;
  double get horizontalPadding => isCompact ? 24 : 64;
}
