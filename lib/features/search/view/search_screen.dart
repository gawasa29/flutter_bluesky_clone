import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  static const routePath = '/Search';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build SearchScreen ');
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: <Widget>[
          Text('SearchScreen'),
        ],
      ),
    );
  }
}
