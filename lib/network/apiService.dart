import 'package:dio/dio.dart';

class ApiService
{
  final Dio dio=Dio();
  static const String BASE_URL = "https://api.alquran.cloud/v1";
  getSurah({required String endponit})async{
        var response= await dio.get('$BASE_URL$endponit');
        return response.data;
  }
}

