import 'package:dio/dio.dart';

class HttpUtil {
  final Dio dio;
  final String? accessToken;

  HttpUtil(String baseUrl, {this.accessToken})
      : dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept-Encoding': 'deflate, gzip',
        'User-Agent':
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36',
      },
      contentType: "application/json",
      responseType: ResponseType.json,
    ),
  );

  /// Attach authorization headers if present
  Map<String, dynamic>? _getAuthorization() {
    if (accessToken != null && accessToken!.isNotEmpty) {
      return {'Authorization': 'Bearer $accessToken'};
    }
    return null;
  }

  /// POST
  Future<Response> post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    final requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    final authorization = _getAuthorization();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    print("---> [POST] URL: ${dio.options.baseUrl}$path");

    final response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    print("---> [POST] Status: ${response.statusCode}");
    print("---> [POST] Raw Response: ${response.data}");

    return response;
  }

  /// GET
  Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    final requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    final authorization = _getAuthorization();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    print("---> [GET] URL: ${dio.options.baseUrl}$path");

    final response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
    );

    print("---> [GET] Status: ${response.statusCode}");
    print("---> [GET] Raw Response: ${response.data}");

    return response;
  }
}