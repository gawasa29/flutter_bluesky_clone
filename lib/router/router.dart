import 'package:flutter/widgets.dart';
import 'package:flutter_bluesky_clone/features/auth/view/handle_name_entry_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/hosting_sign_up_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_in_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_up_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/welcome_screen.dart';
import 'package:flutter_bluesky_clone/features/notification/view/notification_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_bluesky_clone/features/search/view/search_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/profile_screen.dart';
import 'package:flutter_bluesky_clone/router/scaffold_with_bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());
final shellNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      navigatorKey: ref.watch(rootNavigatorKey),
      initialLocation: WelcomeScreen.routePath,
      routes: [
        GoRoute(
          path: WelcomeScreen.routePath,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: WelcomeScreen()),
          routes: [
            GoRoute(
              path: HostingSignUpScreen.routePath,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HostingSignUpScreen()),
              routes: [
                GoRoute(
                  path: SignUpScreen.routePath,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: SignUpScreen()),
                  routes: [
                    GoRoute(
                      path: HandleNameEntryScreen.routePath,
                      pageBuilder: (context, state) => const NoTransitionPage(
                          child: HandleNameEntryScreen()),
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: SignInScreen.routePath,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: SignInScreen()),
            ),
          ],
        ),
        ShellRoute(
          navigatorKey: ref.watch(shellNavigatorKey),
          builder: (context, state, child) => ScaffoldWithBottomNavBar(
            child: child,
          ),
          routes: [
            GoRoute(
              path: HomeScreen.routePath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
            ),
            GoRoute(
              path: SearchScreen.routePath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SearchScreen(),
              ),
            ),
            GoRoute(
              path: NotificationScreen.routePath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: NotificationScreen(),
              ),
            ),
            GoRoute(
              path: ProfileScreen.routePath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
            ),
          ],
        )
      ],
    );
  },
);
