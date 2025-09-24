import 'package:dio/dio.dart';
import 'package:pixabay/core/utils/constants.dart';

class HttpUtil{
  /// singleton - you only create/initialize one class
  /// We maintain one instance of the class through out the app
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.PIXABAY_BASE_URL,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      headers: {
        //'Accept': '*/*',
        'Accept-Encoding': 'deflate, gzip',
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36',
        //'Content-Type': ' application/json',
      },
     // contentType: "application/json; charset=utf-8",
      contentType: "application/json",
      responseType: ResponseType.json
    );

    /// initialize Dio
    dio = Dio(options);
  }

  /// POST REQUEST
  Future post(String path,{
    dynamic data,
     Map<String, dynamic>? queryParameters,
     Options? options
    }) async {
    Options requestOptions = options ?? Options();

    /// if options doesn't exist, use options else create new Options
     requestOptions.headers = requestOptions.headers ?? {};
     Map<String, dynamic>? authorization = getAuthorization();
     if(authorization != null){
       requestOptions.headers!.addAll(authorization);
     }
     Response response = await dio.post(path,
       data: data,
       queryParameters: queryParameters,
       options: requestOptions
     );

    print("---> [HttpUtil] response: ${response}");

    return response;
   }

  Map<String, dynamic>? getAuthorization(){
    var headers = <String, dynamic>{};
    var accessToken = Constants.ACCESS_TOKEN;
    if(accessToken.isNotEmpty){
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  /// GET REQUEST
  Future get(String path,{
    dynamic data,
    Options? options
  }) async {
    Options requestOptions = options ?? Options();

    /// if options doesn't exist, use options else create new Options
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorization();
    if(authorization != null){
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.get(path,
        data: data,
        options: requestOptions
    );
    print("--------> [HttpUtil] response: ${response}");

    return response;
  }
}