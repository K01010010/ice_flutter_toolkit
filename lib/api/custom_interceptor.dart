import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ice_flutter_toolkit/ice_flutter_toolkit.dart';

class CustomInterceptor extends InterceptorsWrapper {
  static ErrorService errorService = ErrorService.get();
  RequestOptions lastRequest = RequestOptions(path: "EMPTY_REQ");

  @override
  void onError(DioException err, [ErrorInterceptorHandler? handler]) {
    if(lastRequest.path != "EMPTY_REQ") {
      lastRequest.describeOnError.log("_REQUEST_");
    }
    err.describe.log("NETWORK_ERROR");

    handler?.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // ApiConfig.authError = false;
    // print("TOKEN IN DIO ${ApiConfig.dio.dioToken}");
    // print("TOKEN IN DIO ${ApiConfig.dio.options.headers["Authorization"]}");

    "Request to ${options.path}\n"
    "Request data ${options.data}\n"
    "Request query ${options.queryParameters.encode}".log();

    lastRequest = options;
    if (!kDebugMode) {
      lastRequest.describeOnError.log();
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!(response.data["success"] as bool)) {
      // if ((response.data["msg"] as String?)?.contains('Ошибка авторизации') ??
      //     false) {
      //   print("TOKEN IN DIO ${ApiConfig.dio.options.headers["Authorization"]}");
      //   ApiConfig.authError = true;
      // }

      onError(DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: response,
        type: DioExceptionType.unknown,
        message: response.data["msg"],
      ));
    }
    response.describe.log("_RESPONSE_");
    handler.next(response);
  }
}

extension ResponseExtension on Response {
  String get describe =>
      "  REQUEST WAS ON ${requestOptions.path} with TYPE ${requestOptions.method}\n"
      "  DATA of Response : ${jsonEncode(data ?? "")}\n";
}

extension RequestOptionsExtension on RequestOptions {
  String get describeOnError => "  REQUEST WAS ON $path with TYPE $method\n"
      "  DATA of Request : ${jsonEncode(data ?? "")}\n";
}

extension DioExceptionExtension on DioException {
  String get describe =>
      "  REQUEST WAS ON ${requestOptions.path} with TYPE ${requestOptions.method}\n"
      "  DATA of Error : ${jsonEncode(requestOptions.data ?? "")}\n"
      "  ERROR of Error : $errorMessage\n"
      "  TYPE of Error  : $type\n"
      "  RESPONSE of Error : $response\n"
      "  MESSAGE of Error : ${response?.data["msg"]}\n";

  String? get errorMessage => response?.data["msg"];
}
