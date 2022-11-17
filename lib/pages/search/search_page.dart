import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.green,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
