import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:jeafriday/jeafire.dart';
import '../theme/color.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

var _bottomNavIndex = 0;

final iconList = <IconData>[
  Icons.home,
  Icons.favorite,
  Icons.shopping_cart,
  Icons.person,
];

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        activeColor: Colors.white,
        inactiveColor: Colors.white60,
        backgroundColor: BdColorDark.extraDarkColor.withOpacity(0.6),
        onTap: (index) {
          setState(() => _bottomNavIndex = index);

          if (_bottomNavIndex == 0) {
            Navigator.pushNamed(context, "/home");
          } else if (_bottomNavIndex == 1) {
            Navigator.pushNamed(context, "/home");
          } else if (_bottomNavIndex == 2) {
            Navigator.pushNamed(context, "/home");
          } else if (_bottomNavIndex == 3) {
            if (JeaFire.isSignedIn()) {
              Future<void> go() async {
                String uid = await JeaFire.getUID();
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/profile/"$uid"');
              }

              go();
            } else {
              Navigator.pushNamed(context, '/register');
            }
          }
        }
        //other params
        );
  }
}

class FloatingActionButtonRef extends StatelessWidget {
  const FloatingActionButtonRef({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: BdColorDark.extraDarkColor.withOpacity(0.8),
      child: const Icon(
        Icons.location_on,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/platforms");
      },
    );
  }
}
