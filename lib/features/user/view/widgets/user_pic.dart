import 'package:flutter/material.dart';

class UserPic extends StatelessWidget {
  const UserPic({required this.radius, required this.avatar, super.key});

  final double radius;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    if (avatar == null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage('assets/images/profile.png'),
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(avatar!),
    );
  }
}
