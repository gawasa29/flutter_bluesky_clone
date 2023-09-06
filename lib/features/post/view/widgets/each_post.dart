import 'package:bluesky/bluesky.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/util/date_time.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_info.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';

class EachPost extends StatelessWidget {
  const EachPost({
    required this.reason,
    required this.replyCount,
    required this.repostCount,
    required this.likeCount,
    required this.text,
    required this.createdAt,
    required this.handle,
    required this.displayName,
    required this.avatar,
    super.key,
  });

  final Reason? reason;

  final int replyCount;
  final int repostCount;
  final int likeCount;

  final String text;
  final DateTime createdAt;

  final String handle;
  final String? displayName;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        //TODO If a better idea sparks a better idea, please someone fix it.
        if (reason != null) RePostMark(reason: reason!),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            UserPic(
              radius: 25,
              avatar: avatar,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      UserInfo(
                        handle: handle,
                        displayName: displayName,
                      ),
                      const Text('・'),
                      Text(humanReadableDateTimeString(createdAt)),
                      const SizedBox(width: 30),
                    ],
                  ),
                  Text(
                    text,
                    style: typography.bodyLarge!.copyWith(),
                  ),
                  ActionIcons(
                    replyCount: replyCount,
                    repostCount: repostCount,
                    likeCount: likeCount,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(thickness: 0.5),
      ],
    );
  }
}

class ActionIcons extends StatelessWidget {
  const ActionIcons({
    required this.replyCount,
    required this.repostCount,
    required this.likeCount,
    super.key,
  });

  final int replyCount;
  final int repostCount;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            print('Tap Reply');
          },
          child: Row(
            children: [
              const Icon(Icons.chat_bubble_outline),
              Text(replyCount.toString()),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('Tap Retweet');
          },
          child: Row(
            children: [
              const Icon(Icons.repeat),
              Text(repostCount.toString()),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('Tap Like');
          },
          child: Row(
            children: [
              const Icon(Icons.favorite_border),
              Text(likeCount.toString()),
            ],
          ),
        ),
        PopupMenuButton<int>(
          icon: const Icon(Icons.more_horiz),
          position: PopupMenuPosition.under,
          onSelected: print,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.g_translate),
                    SizedBox(width: 5),
                    Text('Translate...'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.copy_rounded),
                    SizedBox(width: 5),
                    Text('Copy post text'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.reply),
                    SizedBox(width: 5),
                    Text('Share...'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.speaker_notes_off),
                    SizedBox(width: 5),
                    Text('Mute thread'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 4,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    Text('Delete post'),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}

class RePostMark extends StatelessWidget {
  const RePostMark({required this.reason, super.key});

  final Reason reason;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 35),
        const Icon(Icons.repeat),
        const SizedBox(width: 10),
        Flexible(
          child: Text('Reposted by @${extractHandle(reason.data.toString())}'),
        ),
      ],
    );
  }
}

String extractHandle(String text) {
  final regExp = RegExp('handle: (.*?),');
  final Match? match = regExp.firstMatch(text);

  if (match != null) {
    return match.group(1)!;
  } else {
    return 'No handle was found.';
  }
}
