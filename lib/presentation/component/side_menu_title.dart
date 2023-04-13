import 'package:animiated_sidebar_menu/domain/model/side_menu_data.dart';
import 'package:flutter/material.dart';

class SideMenuTitle extends StatelessWidget {
  final SideMenuData menuData;
  final ValueChanged<SideMenuData> onClickMenu;
  final bool isActive;

  const SideMenuTitle({
    super.key,
    required this.menuData,
    required this.isActive,
    required this.onClickMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: isActive ? 288 : 0,
              height: 56,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF6792FF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                onClickMenu(menuData);
              },
              leading: SizedBox(
                width: 34,
                height: 34,
                child: Icon(
                  menuData.iconData,
                  color: Colors.white,
                ),
              ),
              title: Text(
                menuData.title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
