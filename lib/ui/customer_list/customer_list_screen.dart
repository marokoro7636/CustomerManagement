import 'package:customer_management/ui/components/searchbar.dart';
import 'package:customer_management/ui/customer_list/customer_list_state.dart';
import 'package:customer_management/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_list/customer_list_viewmodel.dart';

class CustomerListScreen extends HookConsumerWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerListProvider);
    final viewModel = ref.watch(customerListProvider.notifier);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Column(
            children: [
              SearchBar(
                openDrawer: Scaffold.of(context).openDrawer,
                onChanged: viewModel.setKeyword,
                controller: viewModel.searchController,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 72,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    MenuAnchor(
                      menuChildren: SearchType.values.map((searchType) {
                        return MenuItemButton(
                          child: Text(searchType.display),
                          onPressed: () => viewModel.setSearchType(searchType),
                        );
                      }).toList(),
                      builder: (context, controller, child) => InputChip(
                        label: Text("検索対象 : ${state.searchType.display}"),
                        selected: true,
                        showCheckmark: false,
                        deleteIcon: const Icon(Icons.arrow_drop_down, size: 18),
                        onDeleted: () {
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                        onSelected: (value) {
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                      ),
                    ),
                    FilterChip(
                      label: const Text('未発送のみ'),
                      selected: state.onlyNotSend,
                      onSelected: (value) {
                        viewModel.changeSwitch(value);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: _CustomerList()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => viewModel.navigateCustomerAddScreen(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CustomerList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerListProvider);
    final viewModel = ref.watch(customerListProvider.notifier);

    final colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: state.customers.length,
      itemBuilder: (BuildContext context, int index) {
        var customer = state.customers[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Card(
            color: customer.isSend ? colorScheme.surface : red80,
            clipBehavior: Clip.hardEdge,
            child: ListTile(
              textColor: customer.isSend ? null : gray10,
              iconColor: customer.isSend ? null : gray10,
              title: Text(
                customer.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: customer.isSend ? colorScheme.onSurface : red20,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${customer.accountName} @${customer.accountId}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(customer.address),
                ],
              ),
              onTap: () async => viewModel.navigateCustomerInfoScreen(index),
            ),
          ),
        );
      },
    );
  }
}
