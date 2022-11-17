import 'package:flutter/material.dart';

import 'package:curso/utils/tab_items.dart';
import 'package:curso/widgets/bottom_navigation.dart';
import 'package:curso/widgets/tab_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<HomePage> {
  TabItem currentTab = TabItem.profile;
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.profile: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.map: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == currentTab) {
      // pop to first route
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await navigatorKeys[currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != TabItem.search) {
            // select 'main' tab
            _selectTab(TabItem.search);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.profile),
          _buildOffstageNavigator(TabItem.search),
          _buildOffstageNavigator(TabItem.map),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        initialRoute: tabItem.initialRoute,
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
