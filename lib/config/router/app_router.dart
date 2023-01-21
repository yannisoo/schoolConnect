import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:school_app/pages/home/home_page.dart';
import 'package:school_app/pages/lesson_create/lesson_create_page.dart';
import 'package:school_app/pages/lesson_details/lesson_details_page.dart';
import 'package:school_app/pages/login/login_page.dart';
import 'package:school_app/pages/register/register_page.dart';
import 'package:school_app/pages/splash/splash_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(
      page: LessonDetailsPage,
      path: '/lesson/:id',
    ),
    AutoRoute(page: LessonCreatePage),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage)
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
