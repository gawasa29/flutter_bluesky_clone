import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routePath = '/Home';
  @override
  Widget build(BuildContext context) {
    print('📱 build HomeScreen ');
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: <Widget>[
          Text('HomeScreen'),
        ],
      ),
    );
  }
}
