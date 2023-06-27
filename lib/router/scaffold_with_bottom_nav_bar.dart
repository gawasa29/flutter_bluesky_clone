import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/notification/view/notification_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_bluesky_clone/features/search/view/search_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/profile_screen.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({required this.child, super.key});

  final Widget child;
  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _navIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
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
        iconSize: 33,
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
      body: widget.child,
    );
  }
}
