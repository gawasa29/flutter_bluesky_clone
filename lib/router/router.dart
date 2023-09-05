import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/blue_sky_app.dart';
import 'package:flutter_bluesky_clone/features/auth/view/handle_name_entry_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/hosting_sign_up_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_in_form_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_in_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_up_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/welcome_screen.dart';
import 'package:flutter_bluesky_clone/features/notification/view/notification_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/compose_post_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_bluesky_clone/features/search/view/search_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/edit_profile_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/moderation_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/profile_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/settings_screen.dart';
import 'package:flutter_bluesky_clone/router/scaffold_with_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GlobalKey<NavigatorState> rootNavigatorKey(RootNavigatorKeyRef ref) {
  return GlobalKey<NavigatorState>();
}

@riverpod
GlobalKey<NavigatorState> shellNavigatorKey(RootNavigatorKeyRef ref) {
  return GlobalKey<NavigatorState>();
}

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    navigatorKey: ref.watch(rootNavigatorKeyProvider),
    initialLocation: WelcomeScreen.routePath,
    redirect: (context, state) {
      print('🐯 IN redirect ');

      final session = BlueSkyApp.session;

      final isLogin = session != null;

      if (isLogin) {
        print('Logged in');

        if (state.location.startsWith(WelcomeScreen.routePath) ||
            state.location.startsWith(SignUpScreen.routePath) ||
            state.location.startsWith(SignInScreen.routePath)) {
          return HomeScreen.routePath;
        }
      } else {
        print('Not Logged in');
        if (state.location.startsWith(HomeScreen.routePath)) {
          return WelcomeScreen.routePath;
        }
      }

      return null;
    },
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
                      child: HandleNameEntryScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: SignInScreen.routePath,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SignInScreen()),
            routes: [
              GoRoute(
                path: SignInFormScreen.routePath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SignInFormScreen()),
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: ref.watch(shellNavigatorKeyProvider),
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
            routes: [
              GoRoute(
                path: EditProfileScreen.routePath,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: EditProfileScreen()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: ComposePostScreen.routePath,
        pageBuilder: (context, state) => const MaterialPage(
          fullscreenDialog: true,
          child: ComposePostScreen(),
        ),
      ),
      GoRoute(
        path: ModerationScreen.routePath,
        builder: (context, state) => const ModerationScreen(),
      ),
      GoRoute(
        path: SettingsScreen.routePath,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
