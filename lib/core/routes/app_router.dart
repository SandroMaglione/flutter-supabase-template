/// Make sure to import `auto_route` and `material` (required)
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/pages/home_page.dart';
import 'package:flutter_supabase_complete/app/pages/sign_in_page.dart';
import 'package:flutter_supabase_complete/app/pages/sign_up_page.dart';
import 'package:flutter_supabase_complete/app/pages/splash_screen_page.dart';

/// Make sure to import `supabase_flutter` to provide its classes to `auto_route`
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashScreenRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
