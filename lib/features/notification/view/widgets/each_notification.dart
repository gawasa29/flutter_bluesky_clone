import 'package:bluesky/bluesky.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/util/date_time.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';

class EachNotification extends StatelessWidget {
  const EachNotification({
    required this.author,
    required this.reason,
    required this.indexedAt,
    super.key,
  });

  final Actor author;

  final NotificationReason reason;

  final DateTime indexedAt;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          if (reason.isLike)
            const Icon(
              Icons.favorite_border,
              color: Colors.pink,
            ),
          if (reason.isRepost)
            const Icon(
              Icons.repeat,
              color: Colors.green,
            ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserPic(
                  radius: 20,
                  avatar: author.avatar,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: author.displayName ?? author.handle,
                      ),
                      TextSpan(
                        text: (reason.isLike)
                            ? ' liked your post'
                            : (reason.isRepost)
                                ? ' reposted your post'
                                : '',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                      TextSpan(
                        text: ' ${humanReadableDateTimeString(indexedAt)}',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                    ],
                    style: typography.bodyMedium!.copyWith(),
                  ),
                ),
                Text(
                  'Description will appear here.',
                  style: typography.bodyLarge!.copyWith(
                    color: colors.onSecondary,
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
