import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    /// routes go here
  ];
}
