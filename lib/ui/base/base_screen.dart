import 'package:customer_management/ui/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:customer_management/ui/route.dart';

class BaseScreen extends HookConsumerWidget {
  BaseScreen({Key? key, required this.screens}) : super(key: key);

  final Widget screens;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(child: screens),
      drawer: AppDrawer(
        selectedIndex: _selectedDrawerIndex(router.location),
        onDestinationSelected: (index) {
          if (index == 0) {
            context.pop();
            context.go(customerPath);
          }
          else if (index == 1) {
            context.push(settingPath);
          }
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedBottomNavigationIndex(router.location),
        onDestinationSelected: (index) {
          if (index == 0) {
            context.go(customerPath);
          } else if (index == 1) {
            context.go(annualSalesPath);
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: '顧客一覧'),
          NavigationDestination(icon: Icon(Icons.info), label: '年間売上'),
        ],
      ),
    );
  }

  static int _selectedDrawerIndex(String location) {
    if (location.contains("/base")) {
      return 0;
    } else if (location.contains(settingPath)) {
      return 1;
    } else {
      return 0;
    }
  }

  static int _selectedBottomNavigationIndex(String location) {
    switch (location) {
      case customerPath:
        return 0;
      case annualSalesPath:
        return 1;
      default:
        return 0;
    }
  }
}
