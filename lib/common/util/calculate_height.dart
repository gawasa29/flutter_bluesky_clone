import 'package:flutter/material.dart';

double calculateExpandedHeight({
  required BuildContext context,
  required String bioText,
  required TextStyle textStyle,
}) {
  final span = TextSpan(
    text: bioText,
    style: textStyle,
  );

  final textPainter = TextPainter(
    text: span,
    maxLines: 30,
    textDirection: TextDirection.ltr,

    /// layout() and maxWidth are absolutely necessary.
    /// The reason layout() is needed is because
    /// TextPainter sets or calculates after calling layout().
    /// Without maxWidth, the end of the line count is not set,
    /// and textPainter.computeLineMetrics() remains as a single line.
  )..layout(maxWidth: MediaQuery.of(context).size.width - 20);

  /// Ensure the line count becomes 1 even if it's 0,
  /// so the UI remains stable even without characters.
  final lines = (textPainter.computeLineMetrics().isEmpty)
      ? 1
      : textPainter.computeLineMetrics().length;

  final expandedHeight = 300.0 + (25 * lines);

  return expandedHeight;
}
