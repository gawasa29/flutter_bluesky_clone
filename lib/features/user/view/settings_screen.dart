import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const routePath = '/Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _selectedFruits = [true, false, false];

  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    print('📱 build SettingsScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Scaffold(
      backgroundColor: colors.secondary,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: typography.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Account',
                style: typography.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Email: yusei112929@gmail.com',
                style: typography.bodyMedium!.copyWith(),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Signed in as',
                style: typography.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              tileColor: colors.background,
              leading: const CircleAvatar(
                radius: 19,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
              ),
              title: const Text('User Name'),
              subtitle: Text(
                '@HandleName',
                style: typography.bodySmall!.copyWith(
                  color: colors.onSecondary,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Sign out'),
              ),
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
                child: const Icon(Icons.add),
              ),
              title: const Text('Add account'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Invite a Friend',
                style: typography.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              tileColor: colors.background,
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.secondary,
                ),
                child: const Icon(Icons.confirmation_number),
              ),
              title: const Text('0 invite codes available'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Appearance',
                style: typography.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              tileColor: colors.background,
              title: Center(
                child: ToggleButtons(
                  direction: vertical ? Axis.vertical : Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      for (var i = 0; i < _selectedFruits.length; i++) {
                        _selectedFruits[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedColor: colors.background,
                  fillColor: colors.onBackground,
                  constraints: const BoxConstraints(
                    minHeight: 30,
                    minWidth: 100,
                  ),
                  isSelected: _selectedFruits,
                  children: const [
                    Text('System'),
                    Text('Light'),
                    Text('Dark'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Advanced',
                style: typography.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              tileColor: colors.background,
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.secondary,
                ),
                child: const Icon(Icons.tune),
              ),
              title: const Text('Home Feed Preferences'),
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
                child: const Icon(Icons.lock),
              ),
              title: const Text('App passwords'),
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
                child: const Icon(Icons.cell_tower),
              ),
              title: const Text('Saved Feeds'),
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
                child: const Icon(Icons.g_translate),
              ),
              title: const Text('Content languages'),
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
                child: const Icon(Icons.alternate_email),
              ),
              title: const Text('Change handle'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Danger Zone',
                style: typography.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              tileColor: colors.background,
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.error,
                ),
                child: Icon(
                  Icons.delete,
                  color: colors.onError,
                ),
              ),
              title: Text(
                'Delete my account...',
                style: typography.bodyLarge!.copyWith(
                  color: colors.error,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Developer Tools',
                style: typography.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              tileColor: colors.background,
              title: const Text('System log'),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'build version 1.0.0 production',
                style: typography.bodySmall!.copyWith(
                  color: colors.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
