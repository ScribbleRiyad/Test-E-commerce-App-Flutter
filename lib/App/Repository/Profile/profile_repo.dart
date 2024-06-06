


import 'dart:convert';
import 'package:dio/dio.dart';



class ProfileRepository {


  final Dio dio = Dio();



  Future<Response<dynamic>> updateProfileData({ data, token}) async {


    try {
      final response = await dio.put(
        'https://apptest.dokandemo.com/wp-json/wp/v2/users/$token',
        data: jsonEncode(data),
        options: Options(
          receiveTimeout: const Duration(seconds: 5000),
          followRedirects: false,
          validateStatus: (status) {
            return status! < 550;
          },
          contentType: Headers.jsonContentType,
          headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}



