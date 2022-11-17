import 'package:flutter/material.dart';
import 'package:curso/utils/tab_items.dart';

import 'package:curso/routes/router.dart' as router;

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    required this.navigatorKey,
    required this.tabItem,
    required this.initialRoute,
  });
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: router.controller,
    );
  }
}
