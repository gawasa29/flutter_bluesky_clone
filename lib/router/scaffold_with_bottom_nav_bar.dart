import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/notification/view/notification_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_bluesky_clone/features/search/view/search_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

final isVisibleProvider = StateProvider<bool>((ref) => true);

class ScaffoldWithBottomNavBar extends ConsumerStatefulWidget {
  const ScaffoldWithBottomNavBar({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState
    extends ConsumerState<ScaffoldWithBottomNavBar> {
  int _navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ScrollToHideWidget(
        height: 100,
        isVisible: ref.watch(isVisibleProvider),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home_2),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.notification),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.profile_circle),
              label: '',
            ),
          ],
          onTap: (int index) {
            _navIndex = index;
            switch (index) {
              case 0:
                context.go(HomeScreen.routePath);
              case 1:
                context.go(SearchScreen.routePath);
              case 2:
                context.go(NotificationScreen.routePath);
              case 3:
                context.go(ProfileScreen.routePath);
              default:
                context.go(HomeScreen.routePath);
            }
          },
          currentIndex: _navIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
      body: widget.child,
    );
  }
}

class ScrollToHideWidget extends StatelessWidget {
  const ScrollToHideWidget({
    required this.child,
    required this.isVisible,
    required this.height,
    super.key,
    this.duration = const Duration(milliseconds: 200),
  });
  final Widget child;
  final double height;
  final Duration duration;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      height: isVisible ? height : 0,
      child: Wrap(
        children: [child],
      ),
    );
  }
}
