import 'package:dio/dio.dart';
import 'package:mnjz_store/core/network/api/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);
  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('${ApiConstants.baseUrl}$endPoint');
    return response.data;
  }
}
