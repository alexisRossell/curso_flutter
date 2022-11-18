import 'package:curso/pages/login/login_controller.dart';
import 'package:curso/pages/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:curso/routes/router.dart' as router;
import 'package:provider/provider.dart';




void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Curso",
      initialRoute: router.loginRoute,
      onGenerateRoute: router.controller,
      debugShowCheckedModeBanner: false,
    );
  }
}
