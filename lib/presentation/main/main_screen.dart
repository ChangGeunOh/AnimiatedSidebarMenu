import 'dart:math';

import 'package:animiated_sidebar_menu/common/const/side_menu.dart';
import 'package:animiated_sidebar_menu/domain/model/side_menu_data.dart';
import 'package:animiated_sidebar_menu/presentation/component/menu_btn.dart';
import 'package:animiated_sidebar_menu/presentation/component/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static String get routePath => '/main';

  static String get routeName => 'main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  bool isSideMenuClosed = true;
  SideMenuData selectedSideMenu = topMenuList.first;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('$isSideMenuClosed');
    return Scaffold(
      backgroundColor: const Color(0xFF17203A),
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: 0,
            // isSideMenuClosed ? -265 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(
              onClick: (value) async {
                setState(() {
                  selectedSideMenu = value;
                });
              },
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              // Offset(isSideMenuClosed ? 288 : 0, 0)
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: selectedSideMenu.screen,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isSideMenuClosed ? 0 : 220,
            curve: Curves.fastOutSlowIn,
            child: MenuBtn(
              isClosed: isSideMenuClosed,
              press: () {
                setState(() {
                  isSideMenuClosed = !isSideMenuClosed;
                });
                if (isSideMenuClosed) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
