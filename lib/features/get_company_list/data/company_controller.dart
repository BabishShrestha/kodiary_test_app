import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodiary_test_app/features/get_company_list/data/company_repo.dart';

final getCompanyListControllerProvider =
    StateNotifierProvider<CompanyController, AsyncValue>((ref) =>
        CompanyController(companyListRepo: ref.read(getCompanyListProvider)));
final getcompanyListByNameControllerProvider =
    StateNotifierProvider<CompanyController, AsyncValue>((ref) =>
        CompanyController(companyListRepo: ref.read(getCompanyListProvider)));
final postLoginWithDomainControllerProvider =
    StateNotifierProvider<CompanyController, AsyncValue>((ref) =>
        CompanyController(companyListRepo: ref.read(getCompanyListProvider)));

class CompanyController extends StateNotifier<AsyncValue> {
  // CompanyController(super.state);
  final CompanyRepository _companyListRepo;

  CompanyController({required CompanyRepository companyListRepo})
      : _companyListRepo = companyListRepo,
        super(const AsyncValue.loading());

  void getWorkList() async {
    final response = await _companyListRepo.getCompanyList();
    state = AsyncData(response);
    if (state is AsyncData && response != null) return;
    if (state is AsyncError) {
      log('error');
    }
  }

  void getWorkItem(String name) async {
    final response = await _companyListRepo.getCompanyListByName(name);
    state = AsyncData(response);
    if (state is AsyncData && response != null) return;
    if (state is AsyncError) {
      log('error');
    }
  }

  void loginWithDomain(
      {required String domain,
      required String email,
      required String password}) async {
    final response = await _companyListRepo.loginWithDomain(
        domain: domain, email: email, password: password);
    if (state is AsyncData && response != null) return;
    state = AsyncData(response);
    if (state is AsyncError) {
      log('error');
    }
  }
}
