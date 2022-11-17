import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.orange,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
