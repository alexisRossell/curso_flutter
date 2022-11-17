import 'package:flutter/material.dart';
import 'package:curso/pages/pages.dart';

const String loginRoute = "login";
const String profileRoute = "profile";
const String searchRoute = "search";
const String mapRoute = "map";

const String homeRoute = "home";

Route<dynamic> controller (RouteSettings settings) {
  switch (settings.name) {
    case loginRoute:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
        settings: settings,
      );
    case homeRoute:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
        settings: settings,
      );
    case profileRoute:
      return MaterialPageRoute(
        builder: (context) => const ProfilePage(),
        settings: settings
      );
    case searchRoute:
      return MaterialPageRoute(
          builder: (context) => const SearchPage(),
          settings: settings
      );
    case mapRoute:
      return MaterialPageRoute(
          builder: (context) => const MapPage(),
          settings: settings
      );
    default:
      throw ("La página no existe");
  }
}