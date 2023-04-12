import 'dart:math';

import 'package:animiated_sidebar_menu/common/rive_data.dart';
import 'package:animiated_sidebar_menu/common/utils/rive_utils.dart';
import 'package:animiated_sidebar_menu/domain/model/rive_asset.dart';
import 'package:animiated_sidebar_menu/presentation/component/menu_btn.dart';
import 'package:animiated_sidebar_menu/presentation/component/side_menu.dart';
import 'package:animiated_sidebar_menu/presentation/home/home_screen.dart';
import 'package:animiated_sidebar_menu/presentation/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  late SMIBool isSlideBarClosed;
  bool isSideMenuClosed = true;
  RiveAsset selectedRiveAsset = sideMenu1.first;

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
            left: isSideMenuClosed ? 0 : -265,
            height: MediaQuery.of(context).size.height,
            child: SideMenu(
              onClick: (value) {
                _animationController.reverse();
                setState(() {
                  selectedRiveAsset = value;
                  isSideMenuClosed = false;
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
                  child: renderScreen(selectedRiveAsset),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            left: isSideMenuClosed ? 220 : 0,
            curve: Curves.fastOutSlowIn,
            child: MenuBtn(
              press: () {
                isSlideBarClosed.value = !isSlideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
                setState(() {
                  isSideMenuClosed = isSlideBarClosed.value;
                });
              },
              riveOnInit: (Artboard value) {
                StateMachineController controller = RiveUtils.getRiveController(
                  value,
                  stateMachineName: 'State Machine 1',
                );
                isSlideBarClosed = controller.findSMI('isOpen') as SMIBool;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget renderScreen(RiveAsset riveAsset) {
    switch (riveAsset.artboard) {
      case 'SEARCH':
        return const SearchScreen();
      default:
        return const HomeScreen();
    }
  }
}
