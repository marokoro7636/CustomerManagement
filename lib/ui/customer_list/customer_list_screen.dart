import 'package:customer_management/ui/customer_list/customer_list_state.dart';
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const _SearchBar(),
              Container(
                alignment: Alignment.centerLeft,
                height: 96,
                child: Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.search),
                    MenuAnchor(
                      menuChildren: SearchType.values.map((searchType) {
                        return MenuItemButton(
                          child: Text(searchType.display),
                          onPressed: () => viewModel.setSearchType(searchType),
                        );
                      }).toList(),
                      builder: (context, controller, child) => FilterChip(
                        label: Text("検索対象 : ${state.searchType.display}"),
                        selected: true,
                        onSelected: (value) {
                          if (controller.isOpen) {
                            controller.close();
                          } else {
                            controller.open();
                          }
                        },
                      ),
                    ),
                    // DropdownMenu<SearchType>(
                    //   label: const Text("検索対象"),
                    //   dropdownMenuEntries: const [
                    //     DropdownMenuEntry(
                    //       value: SearchType.name,
                    //       label: "名前",
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: SearchType.accountId,
                    //       label: "アカウントID",
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: SearchType.accountName,
                    //       label: "アカウント名",
                    //     ),
                    //     DropdownMenuEntry(
                    //       value: SearchType.address,
                    //       label: "住所",
                    //     ),
                    //   ],
                    //   onSelected: (searchType) =>
                    //       viewModel.setSearchType(searchType!),
                    // ),
                    FilterChip(
                      label: const Text('未発送のみ'),
                      selected: state.onlyNotSend,
                      onSelected: (value) {
                        viewModel.changeSwitch(value);
                        print(value);
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
        onPressed: () => viewModel.navigateCustomerEditScreen(context),
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
        return Card(
          color: customer.isSend ? colorScheme.surface : colorScheme.error,
          child: ListTile(
            title: Text(customer.name),
            subtitle: Text(customer.address),
            trailing: Text('${customer.accountName} @${customer.accountId}'),
            textColor:
                customer.isSend ? colorScheme.onSurface : colorScheme.onError,
            onTap: () => viewModel.navigateCustomerInfoScreen(context, index),
          ),
        );
      },
    );
  }
}

class _SearchBar extends HookConsumerWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerListProvider.notifier);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      constraints: const BoxConstraints(minWidth: 360, maxWidth: 720),
      width: double.infinity,
      height: 56,
      child: Material(
        elevation: 3,
        color: colorScheme.surface,
        shadowColor: colorScheme.shadow,
        surfaceTintColor: colorScheme.surfaceTint,
        borderRadius: BorderRadius.circular(56 / 2),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(56 / 2),
          highlightColor: Colors.transparent,
          splashFactory: InkRipple.splashFactory,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => print("menu"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextField(
                      controller: viewModel.searchController,
                      cursorColor: colorScheme.primary,
                      style: textTheme.bodyLarge,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        hintText: '検索',
                        hintStyle: textTheme.bodyLarge?.apply(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      onChanged: (value) => viewModel.setKeyword(value),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
