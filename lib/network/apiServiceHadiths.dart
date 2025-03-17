import 'package:dio/dio.dart';

class ApiServiceHadiths {
  static const String baseUrl = 'https://api.hadith.gading.dev';
  final dio = Dio();
  get({required String endpoints}) async
  {
    var response = await dio.get('$baseUrl$endpoints');
    return response.data;
  }
}