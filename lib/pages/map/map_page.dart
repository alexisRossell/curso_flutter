import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
