import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/ui/annual_sales_screen/annual_sales_screen.dart';
import 'package:customer_management/ui/annual_sales_screen/annual_sales_viewmodel.dart';
import 'package:customer_management/ui/base/base_screen.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_screen.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';
import 'package:customer_management/ui/customer_info/customer_info_screen.dart';
import 'package:customer_management/ui/customer_info/customer_info_viewmodel.dart';
import 'package:customer_management/ui/customer_list/customer_list_screen.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_screen.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_state.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_viewmodel.dart';
import 'package:customer_management/ui/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String customerPath = "/base/customer";
const String annualSalesPath = "/base/annual_sales";
const String settingPath = "/settings";
const String customerInfoPath = "/customer_info";
const String customerAddPath = "/customer_add";
const String customerEditPath = "/customer_edit";
const String orderListUserPath = "/order_list_user";

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) {
    final customerListViewModel = ref.watch(customerListProvider.notifier);
    final annualSalesViewModel = ref.watch(annualSalesProvider.notifier);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: customerPath,
      routes: [
        // メイン画面
        ShellRoute(
          builder: (context, state, child) => BaseScreen(screens: child),
          routes: [
            GoRoute(
              path: customerPath,
              pageBuilder: (context, state) {
                customerListViewModel.loadAllCustomer();
                return const NoTransitionPage<void>(
                  child: CustomerListScreen(),
                );
              },
            ),
            GoRoute(
              path: annualSalesPath,
              pageBuilder: (context, state) {
                annualSalesViewModel.loadGoodsSummary();
                return const NoTransitionPage<void>(
                  child: AnnualSalesScreen(),
                );
              },
            ),
          ],
        ),

        // 設定画面
        GoRoute(
          path: settingPath,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const SettingScreen(),
        ),

        // 顧客詳細画面
        GoRoute(
          path: customerInfoPath,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => ProviderScope(
            overrides: [
              customerInfoProvider.overrideWith(
                (ref) => CustomerInfoViewModel(state.extra as Customer),
              ),
            ],
            child: const CustomerInfoScreen(),
          ),
        ),

        // 顧客追加画面
        GoRoute(
          path: customerAddPath,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => ProviderScope(
            overrides: [
              customerEditProvider.overrideWith(
                (ref) => CustomerEditViewModel(
                  const CustomerEditState(customer: Customer(), addMode: true),
                ),
              ),
            ],
            child: CustomerEditScreen(),
          ),
        ),

        // 顧客注文画面
        GoRoute(
          path: orderListUserPath,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => ProviderScope(
            overrides: [
              orderListUserProvider.overrideWith(
                (ref) => OrderListUserViewModel(
                  OrderListUserState(customer: state.extra as Customer),
                ),
              ),
            ],
            child: const OrderListUserScreen(),
          ),
        ),
      ],
    );
  },
);
