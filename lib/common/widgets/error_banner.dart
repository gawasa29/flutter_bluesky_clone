import 'package:flutter/material.dart';

class ErrorBanner extends StatelessWidget {
  const ErrorBanner({required this.error, super.key});
  final String error;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.error,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.report_gmailerrorred,
              color: colors.onError,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                error,
                style: typography.bodyMedium!.copyWith(
                  color: colors.background,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
