
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodiary_test_app/features/get_company_list/data/company_controller.dart';

import '../domain/company.dart';
import 'company_domain_login_view.dart';

class CompanyHomeView extends ConsumerStatefulWidget {
  const CompanyHomeView({super.key});

  @override
  ConsumerState<CompanyHomeView> createState() => _CompanyHomeViewState();
}

class _CompanyHomeViewState extends ConsumerState<CompanyHomeView> {
  final nameTextController = TextEditingController();
  @override
  void initState() {
    ref.read(getCompanyListControllerProvider.notifier).getWorkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final listlength = List.generate(3, (index) => print(index)).length;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kodiary Test App'),
        ),
        body: ref.watch(getCompanyListControllerProvider).maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (data) => Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final Company company = data[index];
                            return Text(company.name);
                          }),
                    ),
                    const Text('Enter company listing by user name'),
                    Expanded(
                      child: TextField(
                        onChanged: (val) {
                          nameTextController.text = val;
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => CompanyDomainLoginView(
                                  name: nameTextController.text)));
                        },
                        child: const Text('Find Company Item')),
                  ],
                ),
            orElse: () => const Text('Not found'))
        // ListView.builder(
        //   itemCount: ,
        //   itemBuilder: (context, index){

        //     return ListTile(

        //       subtitle: Text("Company $index"),);

        // }),
        );
  }
}
