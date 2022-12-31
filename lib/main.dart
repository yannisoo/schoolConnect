import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/bootstrap.dart';
import 'package:school_app/config/router/app_router.dart';
import 'package:school_app/config/themes.dart';

void main() async {
  runApp(
    UncontrolledProviderScope(container: await bootstrap(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Flutter Demo',
        theme: theme,
      );
}
