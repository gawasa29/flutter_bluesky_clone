import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluesky_clone/router/router.dart';
import 'package:flutter_bluesky_clone/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    const ProviderScope(
      child: MyApp(),
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
