/// Make sure to import `auto_route` and `material` (required)
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/pages/home_page.dart';
import 'package:flutter_supabase_complete/app/pages/sign_in_page.dart';
import 'package:flutter_supabase_complete/app/pages/sign_up_page.dart';
import 'package:flutter_supabase_complete/core/routes/guards/auth_guard.dart';
import 'package:flutter_supabase_complete/core/routes/guards/no_auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignUpPage, initial: true, guards: [NoAuthGuard]),
    AutoRoute(page: SignInPage, guards: [NoAuthGuard]),
    AutoRoute(page: HomePage, guards: [AuthGuard]),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.noAuthGuard, required super.authGuard});
}
