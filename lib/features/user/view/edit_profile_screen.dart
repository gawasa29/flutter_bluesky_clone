import 'package:flutter/material.dart';
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
    return Scaffold(
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
                      const SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://htmlcolorcodes.com/assets/images/colors/bright-blue-color-solid-background-1920x1080.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
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
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                        ),
                      ),
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
