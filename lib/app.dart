import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';

/// Entry widget of the app
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
