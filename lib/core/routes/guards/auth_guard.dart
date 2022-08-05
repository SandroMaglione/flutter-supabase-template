import 'package:auto_route/auto_route.dart';
import 'package:flutter_supabase_complete/core/routes/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Route guard used to checkout for signed in state and
/// redirect to login otherwise
class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    SupabaseAuth.instance.initialSession.then((session) {
      resolver.next(true);
    }).catchError((_) {
      router.push(const SignUpRoute());
    });
  }
}
