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
import 'package:customer_management/ui/order_edit/order_edit_screen.dart';
import 'package:customer_management/ui/order_edit/order_edit_state.dart';
import 'package:customer_management/ui/order_edit/order_edit_viewmodel.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_screen.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_state.dart';
import 'package:customer_management/ui/order_list_user/order_list_user_viewmodel.dart';
import 'package:customer_management/ui/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String customerListPath = "/base/customer_list";
const String annualSalesPath = "/base/annual_sales";
const String settingPath = "/settings";
const String customerInfoPath = "/customer_info";
const String customerAddPath = "/customer_add";
const String customerEditPath = "/customer_edit";
const String orderListUserPath = "/order_list_user";
const String orderAddPath = "/order_add";
const String orderEditPath = "/order_edit";

final currentRouteProvider = StateProvider<String>((ref) => '');

final routingCallbackProvider = Provider<void Function(Routing?)>((ref) {
  return (routing) {
    if (routing == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentRouteProvider.notifier).state = routing.current;
    });

    switch (routing.current) {
      case customerListPath:
        ref.watch(customerListProvider.notifier).loadAllCustomer();
        break;
      case annualSalesPath:
        ref.watch(annualSalesProvider.notifier).loadGoodsSummary();
        break;
    }
  };
});

final getPagesProvider = Provider(
  (ref) => [
    // 顧客一覧画面
    GetPage(
      name: customerListPath,
      page: () => BaseScreen(screens: const CustomerListScreen()),
      transition: Transition.noTransition,
    ),

    // 年間売上画面
    GetPage(
      name: annualSalesPath,
      page: () => BaseScreen(screens: const AnnualSalesScreen()),
      transition: Transition.noTransition,
    ),

    // 設定画面
    GetPage(
      name: settingPath,
      page: () => const SettingScreen(),
    ),

    // 顧客詳細画面
    GetPage(
      name: customerInfoPath,
      page: () => ProviderScope(
        overrides: [
          customerInfoProvider.overrideWith(
            (ref) => CustomerInfoViewModel(Get.arguments as Customer),
          ),
        ],
        child: const CustomerInfoScreen(),
      ),
    ),

    // 顧客追加画面
    GetPage(
      name: customerAddPath,
      page: () => ProviderScope(
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
    GetPage(
      name: '$customerAddPath/nt',
      page: () => ProviderScope(
        overrides: [
          customerEditProvider.overrideWith(
            (ref) => CustomerEditViewModel(
              const CustomerEditState(customer: Customer(), addMode: true),
            ),
          ),
        ],
        child: CustomerEditScreen(),
      ),
      transition: Transition.noTransition,
    ),

    // 顧客編集画面
    GetPage(
      name: customerEditPath,
      page: () => ProviderScope(
        overrides: [
          customerEditProvider.overrideWith(
            (ref) => CustomerEditViewModel(
              CustomerEditState(
                customer: Get.arguments as Customer,
                addMode: false,
              ),
            ),
          ),
        ],
        child: CustomerEditScreen(),
      ),
    ),

    // 顧客注文一覧画面
    GetPage(
      name: orderListUserPath,
      page: () => ProviderScope(
        overrides: [
          orderListUserProvider.overrideWith(
            (ref) {
              final viewModel = OrderListUserViewModel(
                OrderListUserState(customer: Get.arguments as Customer),
              );

              ref.listen(currentRouteProvider, (previous, next) {
                if (next == orderListUserPath) viewModel.loadOrder();
              });

              return viewModel;
            },
          ),
        ],
        child: const OrderListUserScreen(),
      ),
    ),

    // 注文追加画面
    GetPage(
      name: orderAddPath,
      page: () => ProviderScope(
        overrides: [
          orderEditProvider.overrideWith(
            (ref) => OrderEditViewModel(Get.arguments as OrderEditState),
          ),
        ],
        child: const OrderEditScreen(),
      ),
    ),
    GetPage(
      name: '$orderAddPath/nt',
      page: () => ProviderScope(
        overrides: [
          orderEditProvider.overrideWith(
            (ref) => OrderEditViewModel(Get.arguments as OrderEditState),
          ),
        ],
        child: const OrderEditScreen(),
      ),
      transition: Transition.noTransition,
    ),

    // 注文編集画面
    GetPage(
      name: orderEditPath,
      page: () => ProviderScope(
        overrides: [
          orderEditProvider.overrideWith(
            (ref) => OrderEditViewModel(Get.arguments as OrderEditState),
          ),
        ],
        child: const OrderEditScreen(),
      ),
    ),
  ],
);
