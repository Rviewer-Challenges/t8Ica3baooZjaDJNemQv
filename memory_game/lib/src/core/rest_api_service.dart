import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

import 'dio_interceptor.dart';
import 'rest_api_exceptions.dart';

class RestApiBaseHelper {
  /// It handles http Methods in a single place
  ///

  /// GET request
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dynamic responseJson;

    try {
      final dioInterceptor = DioInterceptor.instance;
      // dioInterceptor.dio.interceptors
      //     .add(DioLoggingInterceptor(level: Level.basic, compact: false));
      final response = await dioInterceptor.dio.get<dynamic>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      responseJson = _handleResponse(response);
    } on DioError catch (dioError) {
      _handleError(dioError);
    } catch (e) {
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }

  /// POST request
  Future<dynamic> post(
    String endpoint,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dynamic responseJson;
    try {
      final dioInterceptor = DioInterceptor.instance;
      dioInterceptor.dio.interceptors
          .add(DioLoggingInterceptor(level: Level.body, compact: false));
      final response = await dioInterceptor.dio.post<dynamic>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      responseJson = _handleResponse(response);
    } on DioError catch (dioError) {
      _handleError(dioError);
    } catch (e) {
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }

  /// PUT request
  Future<dynamic> put(
    String endpoint,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dynamic responseJson;
    try {
      final dioInterceptor = DioInterceptor.instance;
      final response = await dioInterceptor.dio.put<dynamic>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      responseJson = _handleResponse(response);
    } on DioError catch (dioError) {
      _handleError(dioError);
    } catch (e) {
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }

  /// PATCH request
  Future<dynamic> patch(
    String endpoint,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dynamic responseJson;
    try {
      final dioInterceptor = DioInterceptor.instance;
      final response = await dioInterceptor.dio.patch<dynamic>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      responseJson = _handleResponse(response);
    } on DioError catch (dioError) {
      _handleError(dioError);
    } catch (e) {
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }

  /// DELETE request
  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    dynamic responseJson;
    try {
      final dioInterceptor = DioInterceptor.instance;
      final response = await dioInterceptor.dio.delete<dynamic>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      responseJson = _handleResponse(response);
    } on DioError catch (dioError) {
      _handleError(dioError);
    } catch (e) {
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }

  /// It handles Dio error types
  dynamic _handleError(DioError error) {
    const commonMessageError =
        'Ups en este momento no es posible acceder a tu aplicación';
    switch (error.type) {
      case DioErrorType.cancel:
        throw FetchDataException(commonMessageError);
      case DioErrorType.connectTimeout:
        throw FetchDataException(commonMessageError);
      case DioErrorType.sendTimeout:
        throw FetchDataException(commonMessageError);
      case DioErrorType.other:
        throw FetchDataException(commonMessageError);
      case DioErrorType.receiveTimeout:
        throw FetchDataException(commonMessageError);
      case DioErrorType.response:
        _handleResponse(error.response!);
        break;
    }
  }

  /// It handles http response
  dynamic _handleResponse(Response response) {
    
    switch (response.statusCode) {
      case 200:
      case 201:
        String? successErrorMessage;
        if (response.data is String) {
          successErrorMessage =
              _hasSuccessErrorMessage(jsonDecode(response.data));
        } else if (response.data is Map) {
          successErrorMessage =
              _hasSuccessErrorMessage(response.data as Map<String, dynamic>);
        } else if (response.data is List) {
          final data = {
            'code': '200',
            'message': 'Success',
            'status': 'ok',
            'data': response.data
          };
          _hasSuccessErrorMessage(data);
        }
        if (successErrorMessage != null) {
          throw FetchDataException(successErrorMessage);
        } else {
          return response.data;
        }
      case 401:
      case 400:
      case 403:
      case 404:
      case 422:
        final error = _handleErrorMessageResponse(response);
        throw BadRequestException(error);
      case 500:
      default:
        String error;
        // const commonMessageError =
        //     'Ups en este momento no es posible acceder a tu aplicación';
        if (response.data is String) {
          error = response.data as String;
          // error = commonMessageError;
        } else {
          error = _handleErrorMessageResponse(response);
        }
        throw FetchDataException(error);
    }
  }

  /// It returns a message if status [200, 201] has any errors
  String? _hasSuccessErrorMessage(Map<String, dynamic> responseData) {
    if (responseData.containsKey('code')) {
      if (responseData['code'] != 200) {
        return responseData['message'].toString();
      }
    }
    return null;
  }

  /// Check for the message property inside the error response.
  String _handleErrorMessageResponse(Response<dynamic> response) {
    var error = 'Ups en este momento no es posible acceder a tu aplicación';
    final data = response.data as Map<String, dynamic>;
    if (data.containsKey('message')) {
      error = _getMessageKey(response, error);
    } else if (data.containsKey('error_description')) {
      error = _getErrorDescriptionKey(response, error);
    } else {
      error = error;
    }
    return error;
  }

  String _getMessageKey(Response<dynamic> response, String commonMessageError) {
    return (((response.data as Map<String, dynamic>)['message'] as String)
            .isNotEmpty)
        ? response.data['message'] as String
        : commonMessageError;
  }

  String _getErrorDescriptionKey(
      Response<dynamic> response, String commonMessageError) {
    return (((response.data as Map<String, dynamic>)['error_description']
                as String)
            .isNotEmpty)
        ? response.data['error_description'] as String
        : commonMessageError;
  }
}
