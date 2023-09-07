import 'package:bluesky/bluesky.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/util/date_time.dart';
import 'package:flutter_bluesky_clone/features/post/repository/post_repository.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EachNotification extends ConsumerWidget {
  const EachNotification({
    required this.author,
    required this.reason,
    required this.indexedAt,
    required this.reasonSubject,
    required this.record,
    super.key,
  });

  final AtUri? reasonSubject;
  final Map<String, dynamic>? record;

  final Actor author;

  final NotificationReason reason;

  final DateTime indexedAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    final post = ref.watch(fetchPostProvider(uri: reasonSubject!));

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
                post.when(
                  error: (error, stackTrace) => Text('Error $error'),
                  loading: SizedBox.new,
                  data: (post) {
                    return Text(
                      post.record.text,
                      style: typography.bodyLarge!.copyWith(
                        color: colors.onSecondary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
