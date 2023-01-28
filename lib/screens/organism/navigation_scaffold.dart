import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:school_app/data/models/navigation_item.dart';

class NavifationScaffold extends StatelessWidget {
  const NavifationScaffold({
    required this.title,
    required this.navigationItems,
    super.key,
  });
  final String title;
  final List<NavigationItem> navigationItems;
  List<PageRouteInfo> get _routes =>
      navigationItems.map((e) => e.route).toList();
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: _routes,
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            leading: const AutoLeadingButton(),
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) async {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              for (final item in navigationItems)
                BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.title,
                ),
            ],
          ),
        );
      },
    );
  }
}
