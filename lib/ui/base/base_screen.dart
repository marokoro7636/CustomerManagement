import 'package:customer_management/ui/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:customer_management/ui/route.dart';

class BaseScreen extends HookConsumerWidget {
  BaseScreen({Key? key, required this.screens}) : super(key: key);

  final Widget screens;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(child: screens),
      drawer: AppDrawer(
        selectedIndex: _selectedDrawerIndex(Get.currentRoute),
        onDestinationSelected: (index) {
          // Drawerを閉じる
          Get.back();
          // 画面遷移
          switch (index) {
            case 0:
              Get.toNamed(customerListPath);
              break;
            case 1:
              Get.toNamed(settingPath);
              break;
          }
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedBottomNavigationIndex(Get.currentRoute),
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              Get.offNamed(customerListPath);
              break;
            case 1:
              Get.offNamed(annualSalesPath);
              break;
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
      case customerListPath:
        return 0;
      case annualSalesPath:
        return 1;
      default:
        return 0;
    }
  }
}
