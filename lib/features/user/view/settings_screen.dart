import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/auth/repository/auth_repository.dart';
import 'package:flutter_bluesky_clone/features/user/repository/user_repository.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  static const routePath = '/Settings';

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _selectedFruits = [true, false, false];

  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    print('📱 build SettingsScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    final profile = ref.watch(fetchProfileProvider);

    return CustomScaffold(
      backgroundColor: colors.secondary,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: typography.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: profile.when(
        error: (error, stackTrace) => Text('Error $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (profile) {
          return SingleChildScrollView(
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
                // TODO Show Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Email: ',
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
                  leading: UserPic(radius: 19, avatar: profile.avatar),
                  title: Text(
                    profile.displayName ?? profile.handle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    profile.handle,
                    style: typography.bodySmall!.copyWith(
                      color: colors.onSecondary,
                    ),
                  ),
                  trailing: TextButton(
                    onPressed: () {
                      ref.read(authCommandProvider.notifier).signOut();
                    },
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
                    child: const Icon(
                      FontAwesomeIcons.plus,
                      size: 18,
                    ),
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
                    child: const Icon(
                      FontAwesomeIcons.ticket,
                      size: 18,
                    ),
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
                    child: const Icon(
                      FontAwesomeIcons.sliders,
                      size: 18,
                    ),
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
                    child: const Icon(
                      FontAwesomeIcons.lock,
                      size: 18,
                    ),
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
                    child: const Icon(
                      FontAwesomeIcons.satelliteDish,
                      size: 18,
                    ),
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
                    child: const Icon(
                      FontAwesomeIcons.language,
                      size: 18,
                    ),
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
                    child: const Icon(
                      FontAwesomeIcons.at,
                      size: 18,
                    ),
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
                      FontAwesomeIcons.trashCan,
                      size: 18,
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
          );
        },
      ),
    );
  }
}
