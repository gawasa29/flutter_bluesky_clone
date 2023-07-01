import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/background_pic.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  static const routePath = 'EditProfile';
  static const routeFullPath = '/Profile/EditProfile';
  @override
  Widget build(BuildContext context) {
    print('📱 build EditProfileScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return CustomScaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(
                'Edit my profile',
                style: typography.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const BackgroundPic(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.secondary,
                          ),
                          child: const Icon(
                            Icons.photo_camera,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 88, left: 10),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const UserPic(radius: 40),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors.secondary,
                        ),
                        child: const Icon(
                          Icons.photo_camera,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Display Name',
                    style: typography.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: '   e.g. Alice Roberts',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Description',
                    style: typography.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    minLines: 4,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: '   e.g. Artist,dog-lover, and avid reader',
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 30),
                      backgroundColor: colors.primary,
                    ),
                    child: Text(
                      'Save Changes',
                      style: typography.bodyMedium!.copyWith(
                        color: colors.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pop();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 30),
                      backgroundColor: colors.background,
                      elevation: 0,
                    ),
                    child: Text(
                      'Cancel',
                      style: typography.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
