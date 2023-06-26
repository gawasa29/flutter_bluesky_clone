import 'package:flutter/widgets.dart';
import 'package:flutter_bluesky_clone/features/auth/view/welcome_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = Provider((ref) => GlobalKey<NavigatorState>());

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
        ),
      ],
    );
  },
);
