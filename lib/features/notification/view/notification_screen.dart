import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const routePath = '/Notification';
  @override
  Widget build(BuildContext context) {
    print('📱 build NotificationScreen ');
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: <Widget>[
          Text('NotificationScreen'),
        ],
      ),
    );
  }
}
