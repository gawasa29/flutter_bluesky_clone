import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    final colors = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UserName',
          style: typography.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '@HandleName',
          style: typography.bodySmall!.copyWith(
            color: colors.onSecondary,
          ),
        ),
      ],
    );
  }
}
