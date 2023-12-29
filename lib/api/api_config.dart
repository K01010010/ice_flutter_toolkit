part of '../../ice_flutter_toolkit.dart';

// ignore_for_file: avoid_print
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:ice_flutter_toolkit/ui/pages/error_service_page/error_service.dart';
// import 'package:ice_flutter_toolkit/utils/extensions.dart';
//
// class ApiConfigBase extends ApiConfig {
//   ApiConfigBase.create() : super.create();
// }
//
// abstract class ApiConfig {
//
//   ApiConfig.create();
//   static ApiConfig? singleton; // = ApiConfig._();
//   static ApiConfig get([ApiConfig? api]) {
//     singleton ??= (api ?? ApiConfigBase.create());
//     return singleton!;
//   }
//
//   static const String baseUrl = String.fromEnvironment(
//     'API_URL',
//     defaultValue: 'http://dev-uni.ledokol.it/uni/api/v1',
//   );
//   static const String imageUrl = String.fromEnvironment(
//     'API_URL',
//     defaultValue: "http://dev-uni.ledokol.it",
//   );
//
//   static const Map<String, String> defaultHeaders = {
//     'Content-Type': Headers.jsonContentType
//     // 'Content-Type': Headers.formUrlEncodedContentType
//   };
//
//   static void setToken(String? token) => dio.setToken(token);
//
//   static Dio? _dio;
//
//   static Dio get dio {
//     _dio ??= Dio(BaseOptions(
//       headers: defaultHeaders,
//       baseUrl: baseUrl,
//       receiveDataWhenStatusError: true,
//     ))
//       ..interceptors.add(CustomInterceptor());
//     return _dio!;
//   }
// }

extension ExtendingDio on Dio {
  static String? _dioToken;

  String? get dioToken => _dioToken;

  set dioToken(String? val) => _dioToken = val;

  void setToken(String? token) {
    dioToken = token;
    if (token == null) {
      options.headers.remove('Authorization');
    } else {
      options.headers['Authorization'] = 'Bearer $token';
    }
  }
}
//
// class CustomInterceptor extends InterceptorsWrapper {
//   static ErrorService errorService = ErrorService.get();
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     if (kDebugMode) {
//       print(
//           'RESULT RESPONSE -> ${err.requestOptions.path} ${err.requestOptions.method}');
//       print('ERROR : ${err.error}');
//       print('MESSAGE : ${err.message}');
//       print(
//           'RESULT RESPONSE -> ${err.requestOptions.path} ${err.requestOptions.method}');
//     } else {
//       // FirebaseCrashlytics.instance.recordError(err,err.stackTrace,reason: 'RESULT RESPONSE -> ${err.requestOptions.path} ${err.requestOptions.method} --- ERROR : ${err.error} MESSAGE : ${err.message}');
//     }
//
//     errorService.setErrorMessage(err.message);
//     handler.next(err);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     if (kDebugMode) {
//       print(
//           'RESULT RESPONSE -> ${response.requestOptions.path} ${response.requestOptions.method}');
//       jsonEncode(response.data).printFull();
//       print(
//           'RESULT RESPONSE -> ${response.requestOptions.path} ${response.requestOptions.method}');
//     } else {
//       // FirebaseCrashlytics.instance.log(
//       //     'RESULT RESPONSE -> ${response.requestOptions.path} ${response.requestOptions.method} <----- RESULT RESPONSE : ${jsonEncode(response.data)}');
//     }
//     handler.next(response);
//   }
// }
