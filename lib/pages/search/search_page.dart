import 'package:curso/pages/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchController(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.lightBlue,
        ),
        child: Scaffold(
          body: SafeArea(
            child: Consumer<SearchController>(
              builder: (context, searchController, widget) => ListView(
                children: searchController.todos
                    .mapIndexed(
                      (index, todo) => ListTile(
                        tileColor: index.isEven ? Colors.grey : Colors.white,
                        title: Text(todo.title ?? ""),
                        trailing: Icon((todo.completed ?? false)
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
