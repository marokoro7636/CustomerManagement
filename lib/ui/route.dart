import 'package:customer_management/ui/annual_sales_screen/annual_sales_screen.dart';
import 'package:customer_management/ui/annual_sales_screen/annual_sales_viewmodel.dart';
import 'package:customer_management/ui/base/base_screen.dart';
import 'package:customer_management/ui/customer_list/customer_list_screen.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String customerPath = "/base/customer";
const String annualSalesPath = "/base/annual_sales";
const String settingPath = "/settings";

final routerProvider = Provider(
  (ref) {
    final customerListViewModel = ref.watch(customerListProvider.notifier);
    final annualSalesViewModel = ref.watch(annualSalesProvider.notifier);

    return GoRouter(
      initialLocation: customerPath,
      routes: [
        ShellRoute(
          builder: (context, state, child) => BaseScreen(screens: child),
          routes: [
            GoRoute(
              path: customerPath,
              builder: (context, state) {
                customerListViewModel.loadAllCustomer();
                return CustomerListScreen(
                  openDrawer: Scaffold.of(context).openDrawer,
                );
              },
            ),
            GoRoute(
              path: annualSalesPath,
              builder: (context, state) {
                annualSalesViewModel.loadGoodsSummary();
                return const AnnualSalesScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: settingPath,
          builder: (context, state) => const AnnualSalesScreen(),
        ),
      ],
    );
  },
);
