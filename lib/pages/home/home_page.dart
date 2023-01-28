import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_app/config/router/app_router.dart';
import 'package:school_app/data/models/navigation_item.dart';
import 'package:school_app/screens/organism/navigation_scaffold.dart';

import 'package:school_app/utils/date_formatter.dart';

class HomePage extends ConsumerWidget with DateFormatter {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavifationScaffold(
      title: 'Home',
      navigationItems: [
        NavigationItem(
          icon: Icons.calendar_today,
          title: 'Calendar',
          route: const LessonListPageRoute(),
        ),
        NavigationItem(
          icon: Icons.access_time_outlined,
          title: 'Presence',
          route: const AttendancePageRoute(),
        ),
      ],
    );
  }
}
