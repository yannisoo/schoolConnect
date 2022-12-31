import 'package:auto_route/auto_route.dart';
import 'package:familly/config/router/app_router.dart';
import 'package:familly/config/supabase_instance.dart';
import 'package:flutter/material.dart';

@immutable
class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _redirectCalled = false;

  @override
  void initState() {
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = supabase.auth.currentSession;
    if (session != null) {
      AutoRouter.of(context).push(const HomePageRoute());
    } else {
      AutoRouter.of(context).push(const LoginPageRoute());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
}
