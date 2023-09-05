import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluesky_clone/common/blue_sky_app.dart';
import 'package:flutter_bluesky_clone/features/auth/repository/auth_repository.dart';
import 'package:flutter_bluesky_clone/router/router.dart';
import 'package:flutter_bluesky_clone/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await BlueSkyApp.initializeApp();

  final sharedPreferences = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(
        AuthRepository(sharedPreferences),
      ),
    ],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ref.watch(themeProvider).toThemeData(),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
