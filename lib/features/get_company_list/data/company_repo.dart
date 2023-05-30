
import 'package:flutter/material.dart';
import 'package:kodiary_test_app/core/api/dio_client.dart';
import 'package:riverpod/riverpod.dart';

import '../domain/company.dart';
import '../domain/theme_response.dart';

abstract class CompanyRepository {
  Future<List<Company>?> getCompanyList();
  Future<List<Company>?> getCompanyListByName(String name);
  Future<ThemeResponse?> loginWithDomain(
      {required String domain,
      required String email,
      required String password});
}

final getCompanyListProvider =
    Provider((ref) => CompanyRepositoryImpl(ref: ref));

class CompanyRepositoryImpl extends CompanyRepository {
  final Ref ref;
  CompanyRepositoryImpl({required this.ref});
  @override
  Future<List<Company>?> getCompanyList() async {
    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get('authentication/companies-listing');
      // log(response.data['data'].toString());
      final companyList = (response.data['data'] as List<dynamic>)
          .map((element) => Company.fromJson(element))
          .toList();
      return companyList;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<ThemeResponse?> loginWithDomain(
      {required String domain,
      required String email,
      required String password}) async {
    try {
      final dio = ref.read(dioProvider);
      dio.options.headers['Origin'] = "https://$domain";
      final response = await dio.post('authentication/login',
          data: {"email": email, "password": password});
      // log(response.data['data'].toString());
      final loginResponse = ThemeResponse.fromJson(response.data);
      return loginResponse;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<List<Company>?> getCompanyListByName(String name) async {
    try {
      final dio = ref.read(dioProvider);
      final response =
          await dio.get('authentication/companies-listing', queryParameters: {
        "name": name,
      });
      // log(response.data['data'].toString());
      final companyList = (response.data['data'] as List<dynamic>)
          .map((element) => Company.fromJson(element))
          .toList();
      return companyList;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
    // throw UnimplementedError();
  }
}
