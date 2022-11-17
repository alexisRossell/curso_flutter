import 'package:curso/routes/router.dart' as router;

enum TabItem {
  profile(
    router.profileRoute,
  ),
  search(
    router.searchRoute,
  ),
  map(
    router.mapRoute,
  );

  const TabItem(this.initialRoute);
  final String initialRoute;
}
