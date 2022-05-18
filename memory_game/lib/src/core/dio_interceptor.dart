// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:memory_game/src/app/injection_container.dart';


class DioInterceptor {
  /// Singleton to intercept http requests using dio
  ///
  static DioInterceptor instance = DioInterceptor._();

  late Dio dio;

  /// The base url
  static final String _baseUrl = dotenv.env['MAPBOX_BASE_URL']!;

  /// Time to open an url
  static final int _connectTimeout = int.parse(dotenv.env['CONNECT_TIMEOUT']!);

  /// Time to receive data response
  static final int _receiveTimeout = int.parse(dotenv.env['RECEIVE_TIMEOUT']!);

  // ignore: sort_constructors_first
  DioInterceptor._() {
    final storage = getIt<FlutterSecureStorage>();
    dio = Dio();
    final tokenDio = Dio();
    String? csrfToken;
    dio.options.baseUrl = _baseUrl;
    dio.options.connectTimeout = _connectTimeout;
    dio.options.receiveTimeout = _receiveTimeout;
    dio.options.contentType = 'application/json';
    tokenDio.options = dio.options;
    dio.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        _showOptionsInfoInConsole(options);
        csrfToken = await storage.read(key: 'cookie');
        if (csrfToken != null) {
          options.headers["cookie"] = csrfToken;
        }
        return handler.next(options);
      },
      onResponse: (Response response, handler) async {
        //get cooking from response
        final cookies = response.headers.map['set-cookie'];
        if (cookies != null && cookies.isNotEmpty) {
          final authToken = cookies[0];

          csrfToken = authToken;
          await storage.write(key: 'cookie', value: authToken);
          print(authToken);
        }
        return handler.next(response); // continue
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }

  /// Just to see logs in console, this is just for development purposes
  void _showOptionsInfoInConsole(RequestOptions options) {
    print('====================SENDING REQUEST=========================');
    print('PATH: ${options.path}');
    print('baseUrl: ${options.baseUrl}');
    print('contentType: ${options.contentType}');
    print('data: ${options.data.toString()}');
    print('extra: ${options.extra}');
    print('Headers: ${options.headers}');
    print('============================================================');
  }
}
