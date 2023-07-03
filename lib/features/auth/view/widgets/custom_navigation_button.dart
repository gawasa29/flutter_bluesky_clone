import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    required this.onPressed,
    super.key,
  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    print('📱 build CustomNavigationButton ');
    return Row(
      children: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Back'),
        ),
        Expanded(child: Container()),
        TextButton(
          onPressed: onPressed,
          child: const Text('Next'),
        ),
      ],
    );
  }
}
