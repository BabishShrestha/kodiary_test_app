import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodiary_test_app/features/get_company_list/data/company_controller.dart';
import 'package:kodiary_test_app/features/get_company_list/domain/company.dart';
import 'package:kodiary_test_app/features/get_company_list/domain/theme_response.dart';

class CompanyDomainLoginView extends ConsumerStatefulWidget {
  final String name;
  const CompanyDomainLoginView({required this.name, super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompanyDomainLoginViewState();
}

class _CompanyDomainLoginViewState
    extends ConsumerState<CompanyDomainLoginView> {
  @override
  void initState() {
    ref
        .read(getcompanyListByNameControllerProvider.notifier)
        .getWorkItem(widget.name);
    final domainName = ref
        .read(getCompanyListControllerProvider)
        .whenData((data) {
          final Company company = data[0];
          return company.domain;
        })
        .asData
        ?.value;
    ref.read(postLoginWithDomainControllerProvider.notifier).loginWithDomain(
          domain: domainName!,
          email: 'suman@kodiary.com',
          password: 'P@ssw0rd',
        );
    log(domainName.toString());
    super.initState();
  }

  ValueNotifier<Color> appBarColorNotifier = ValueNotifier<Color>(Colors.blue);
  @override
  Widget build(BuildContext context) {
    log(appBarColorNotifier.value.toString());
    return ValueListenableBuilder<Color>(
        valueListenable: appBarColorNotifier,
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(backgroundColor: value),
            body: ref.watch(postLoginWithDomainControllerProvider).maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (data) {
                  final ThemeResponse theme = data;

                  appBarColorNotifier.value = Color(
                    int.parse(
                        theme.theme.palettes[0].value.replaceAll('#', '0xFF')),
                  );

                  // log(defaultColor.toString());
                  return Column(
                    children: [
                      Text("Login Successful"),
                      Text(theme.theme.primaryTextColor),
                    ],
                  );
                },
                error: (error, stackTrace) => Text(
                      error.toString(),
                    ),
                orElse: () => const Text('No data')),
          );
        });
  }
}
