
import 'package:dio/dio.dart';

import '../../Api/urls.dart';
import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';

class AuthenticationRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> registration({data}) async {
    dynamic response = await _apiServices.postApi(data,Urls.register);

    return response;
  }
  final Dio _dio = Dio();

  Future<Response<dynamic>> login({formData,String? token })async {


    try {
      final response = await _dio.post(
        Urls.login,
        data: FormData.fromMap(formData),
        options: Options(

          receiveTimeout: const Duration(seconds: 5000),
          followRedirects: false,
          validateStatus: (status) {
            return status! < 550;
          },
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
            if (token != null) 'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } catch (e) {

      rethrow; // Re-throw the error to handle it at a higher level
    }
  }

}
