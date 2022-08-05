import 'package:auto_route/auto_route.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Route guard used to checkout for signed in state and
/// redirect to home page when logged
class NoAuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    SupabaseAuth.instance.initialSession.then((session) {
      router.push(const HomeRoute());
    }).catchError((_) {
      resolver.next(true);
    });
  }
}
