import 'package:flutter/material.dart';

class ModerationScreen extends StatelessWidget {
  const ModerationScreen({super.key});
  static const routePath = '/Moderation';
  @override
  Widget build(BuildContext context) {
    print('📱 build ModerationScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Scaffold(
      backgroundColor: colors.secondary,
      appBar: AppBar(
        title: Text(
          'Moderation',
          style: typography.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Divider(height: 0),
          ListTile(
            tileColor: colors.background,
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.secondary,
              ),
              child: const Icon(Icons.visibility),
            ),
            title: const Text('Content filtering'),
          ),
          const Divider(height: 0),
          ListTile(
            tileColor: colors.background,
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.secondary,
              ),
              child: const Icon(Icons.group_off),
            ),
            title: const Text('Mute lists'),
          ),
          const Divider(height: 0),
          ListTile(
            tileColor: colors.background,
            leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.secondary,
                ),
                child: const Icon(Icons.person_off)),
            title: const Text('Muted accounts'),
          ),
          const Divider(height: 0),
          ListTile(
            tileColor: colors.background,
            leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.secondary,
                ),
                child: const Icon(Icons.block)),
            title: const Text('Blocked accounts'),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}
