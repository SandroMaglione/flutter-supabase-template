import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_supabase_complete/app.dart';
import 'package:flutter_supabase_complete/constants.dart';
import 'package:flutter_supabase_complete/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Used to validate certificates for local development.
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

/// Shared `runApp` configuration.
///
/// Used to initialize all required dependencies, packages, and constants.
Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Used to validate certificates for local development
  HttpOverrides.global = MyHttpOverrides();

  // Dependency injection (injectable)
  configureDependencies();

  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnnonKey,
  );

  runApp(const App());
}
