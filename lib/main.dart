import 'package:flutter/material.dart';
import 'package:curso/routes/router.dart' as router;

void main() {
  runApp(
    const MyApp(),
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
