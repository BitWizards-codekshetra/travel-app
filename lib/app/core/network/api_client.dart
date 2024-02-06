import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hackathon_proj/app/core/network/endpoints.dart';
import 'package:hackathon_proj/app/core/network/logger.dart';
import 'package:hackathon_proj/app/core/network/retry_interceptor.dart';

class ApiClient {
  Dio init() {
    Dio _dio = new Dio();
    _dio.interceptors
      ..add(ApiInterceptors(_dio))
      ..add(dioLoggerInterceptor)
      ..add(RetryInterceptor(DioConnectivityRequestRetrier(
          dio: _dio, connectivity: Connectivity())))
      ..add(CurlLoggerDioInterceptor());
    _dio.options.baseUrl = Endpoints.base.url;
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  final Dio dio;
  const ApiInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    const tokenExpiredStatus = 401;
    if (err.requestOptions.path.isNotEmpty) {}
    if (err.response?.statusCode == tokenExpiredStatus) {
      // final signupRepo = SignupRepositoryImpl();
      // final response = await signupRepo.refreshToken();
      // if (response.success ?? false) {
      //   handler.resolve(await dio.fetch(err.requestOptions));
      // }
    } else {
      // ToastMessage.FailMessage(
      //     err.response?.data["message"] ?? "Something went wrong");
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
