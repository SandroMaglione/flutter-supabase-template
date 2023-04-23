import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Initial loading route of the app.
///
/// Used to load required information before starting the app (auth).
@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    /// Load auth session.
    ///
    /// Wait a minium `delayed` time in any case
    /// to avoid flashing screen.
    Future.wait([
      SupabaseAuth.instance.initialSession,
      Future.delayed(
        const Duration(milliseconds: 2000),
      ),
    ]).then((responseList) {
      final session = responseList.first as Session?;

      /// Redirect to either home or sign in routes based on current session.
      if (session != null) {
        context.router.replace(
          HomeRoute(user: session.user),
        );
      } else {
        context.router.replace(
          const SignInRoute(),
        );
      }
    }).catchError((_) {
      context.router.replace(const SignInRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
