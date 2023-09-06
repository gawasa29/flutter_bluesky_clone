import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    required this.handle,
    required this.displayName,
    super.key,
  });

  final String handle;
  final String? displayName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    final colors = theme.colorScheme;

    return Flexible(
      child: Row(
        children: [
          Flexible(
            child: Text(
              displayName ?? handle,
              style: typography.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Flexible(
            child: Text(
              '@$handle',
              style: typography.bodyMedium!.copyWith(
                color: colors.onSecondary,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
