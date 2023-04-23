import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/repository/auth_repository.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:flutter_supabase_complete/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Entry widget of the app.
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();

    /// Listen for authentication events and redirect to
    /// correct page when key events are detected.
    Supabase.instance.client.auth.onAuthStateChange.listen((authState) {
      final event = authState.event;
      final session = authState.session;
      if (event == AuthChangeEvent.signedIn) {
        if (session != null) {
          _appRouter
            ..popUntilRoot()
            ..replace(HomeRoute(user: session.user));
        } else {
          getIt<AuthRepository>().signOut();
        }
      } else if (event == AuthChangeEvent.signedOut) {
        _appRouter
          ..popUntilRoot()
          ..replace(const SignInRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
