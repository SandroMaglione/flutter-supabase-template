import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:flutter_supabase_complete/core/routes/guards/auth_guard.dart';
import 'package:flutter_supabase_complete/core/routes/guards/no_auth_guard.dart';

/// Entry widget of the app
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter(
    authGuard: AuthGuard(),
    noAuthGuard: NoAuthGuard(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
