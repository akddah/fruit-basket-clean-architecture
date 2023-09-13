import 'package:dio/dio.dart';
import 'package:fruit_basket/core/utils/user_cashed.dart';

class DioHelper {
  final UserCashed userCashed;
  final Dio _dio = Dio();

  DioHelper(this.userCashed);

  Future<Response> post(String url, {Map<String, dynamic>? body, Map<String, dynamic>? prams}) async {
    try {
      print(body);
      final result = await _dio.post(
        url,
        data: FormData.fromMap(body ?? {}),
        queryParameters: prams,
        options: Options(headers: {"Accept": "application/json", if (userCashed.isAuth) "Authorization": "Bearer ${userCashed.token}"}),
      );
      print(result.data);
      return result;
    } on DioException catch (e) {
      print(e.response?.data);
      e.response?.data ??= {};
      return e.response ?? Response(requestOptions: RequestOptions(), data: {});
    } catch (e) {
      return Response(requestOptions: RequestOptions(), data: {});
    }
  }

  Future<Response> get(String url, {Map<String, dynamic>? prams}) async {
    try {
      final result = await _dio.get(
        url,
        queryParameters: prams,
        options: Options(headers: {"Accept": "application/json", if (userCashed.isAuth) "Authorization": "Bearer ${userCashed.token}"}),
      );
      print(result.data);
      return result;
    } on DioException catch (e) {
      print(e.response?.data);
      print(e.response);
      e.response?.data ??= <String, dynamic>{"message": "Data not found"};
      return e.response ?? Response(requestOptions: RequestOptions(), data: <String, dynamic>{"message": "Data not found"});
    } catch (e) {
      return Response(requestOptions: RequestOptions(), data: <String, dynamic>{"message": "Data not found"});
    }
  }
}
