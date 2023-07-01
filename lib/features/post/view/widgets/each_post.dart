import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_info.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';

class EachPost extends StatelessWidget {
  const EachPost({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            const UserPic(radius: 25),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const UserInfo(),
                      Expanded(child: Container()),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: typography.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Posts will appear here.',
                    style: typography.bodyLarge!.copyWith(),
                  ),
                  const ActionIcons(),
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
  const ActionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            print('Tap Reply');
          },
          child: const Row(
            children: [
              Icon(Icons.chat_bubble_outline),
              Text('0'),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('Tap Retweet');
          },
          child: const Row(
            children: [
              Icon(Icons.repeat),
              Text('0'),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('Tap Like');
          },
          child: const Row(
            children: [
              Icon(Icons.favorite_border),
              Text('0'),
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
