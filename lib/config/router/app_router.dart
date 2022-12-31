import 'package:auto_route/auto_route.dart';
import 'package:familly/pages/home/home_page.dart';
import 'package:familly/pages/login/login_page.dart';
import 'package:familly/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: LoginPage)
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
