import 'package:dio/dio.dart';

class ApiServiseLesson {
  static const String baseUrl = "https://api3.islamhouse.com/v3";
  final dio =Dio();
  get({required String endpoints}) async
  {
    var response = await dio.get('$baseUrl$endpoints');
    return response.data;
  }
}