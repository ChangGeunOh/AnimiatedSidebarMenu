import 'package:animiated_sidebar_menu/domain/model/side_menu_data.dart';
import 'package:animiated_sidebar_menu/presentation/home/home_screen.dart';
import 'package:animiated_sidebar_menu/presentation/search/search_screen.dart';
import 'package:flutter/material.dart';


List<SideMenuData> topMenuList = [
  SideMenuData(
    title: 'Home',
    iconData: Icons.home_outlined,
    screen: const HomeScreen(),
  ),
  SideMenuData(
    title: 'Search',
    iconData: Icons.search_outlined,
    screen: const SearchScreen(),
  ),
  SideMenuData(
    title: 'Favorites',
    iconData: Icons.favorite_outline,
    screen: const HomeScreen(),
  ),
  SideMenuData(
    title: 'Help',
    iconData: Icons.chat_outlined,
    screen: const HomeScreen(),
  ),
];

List<SideMenuData> bottomMenuList = [
  SideMenuData(
    title: 'History',
    iconData: Icons.timer_outlined,
    screen: const HomeScreen(),
  ),
  SideMenuData(
    title: 'Notification',
    iconData: Icons.notifications_outlined,
    screen: const HomeScreen(),
  )
];
