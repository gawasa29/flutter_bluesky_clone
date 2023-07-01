import 'package:flutter/material.dart';

class BackgroundPic extends StatelessWidget {
  const BackgroundPic({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 150,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://htmlcolorcodes.com/assets/images/colors/bright-blue-color-solid-background-1920x1080.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
