import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';


final dioProvider= Provider((ref) => DioClient().dio(),);
class DioClient{
Dio dio(){

  final dio=Dio();
  


  
  final options = BaseOptions(
    headers: {
      "Accept": Headers.jsonContentType,
    },
    baseUrl: 'https://gateway.cronlink.ca/api/v1/',
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  dio.options=options;
  return dio;
}
 

}