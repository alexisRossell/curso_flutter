import 'package:flutter/material.dart';
import 'package:curso/utils/tab_items.dart';

import 'package:curso/utils/colors.dart' as colors;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      iconSize: 35,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
          Icons.person,
          TabItem.profile,
        ),
        _buildItem(
          Icons.search,
          TabItem.search,
        ),
        _buildItem(
          Icons.map,
          TabItem.map,
        ),
      ],
      onTap: (index) {
        onSelectTab(
          TabItem.values[index],
        );
      },
      currentIndex: currentTab.index,
    );
  }

  BottomNavigationBarItem _buildItem(IconData icon, TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
          icon,
          color: currentTab == tabItem ? colors.lightBlue : colors.blackText
      ),
      label: "",
    );
  }

}
