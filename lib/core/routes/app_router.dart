/// Make sure to import `auto_route` and `material` (required)
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
