import 'package:animiated_sidebar_menu/common/rive_data.dart';
import 'package:animiated_sidebar_menu/domain/model/side_menu_data.dart';
import 'package:animiated_sidebar_menu/presentation/component/info_card.dart';
import 'package:animiated_sidebar_menu/presentation/component/side_menu_title.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  final ValueChanged<SideMenuData> onClick;

  const SideMenu({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  SideMenuData selectedSideMenu = topMenuList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: 'ChangGeunOh',
                profession: 'Android Flutter Developer',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 32,
                  bottom: 16,
                ),
                child: Text(
                  'Browser'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),

              ...topMenuList.map(
                (e) => SideMenuTitle(
                  menuData: e,
                  isActive: selectedSideMenu == e,
                  onClickMenu: (menuData) {
                    widget.onClick(menuData);
                    setState(() {
                      selectedSideMenu = menuData;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 32,
                  bottom: 16,
                ),
                child: Text(
                  'History'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...bottomMenuList.map(
                (e) => SideMenuTitle(
                  menuData: e,
                  isActive: selectedSideMenu == e,
                  onClickMenu: (menuData) {
                    setState(() {
                      selectedSideMenu = menuData;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
