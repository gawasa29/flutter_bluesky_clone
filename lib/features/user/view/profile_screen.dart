import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routePath = '/Profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build ProfileScreen ');
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: <Widget>[
          Text('ProfileScreen'),
        ],
      ),
    );
  }
}
