library dio_logger;

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

final dioLoggerInterceptor =
    InterceptorsWrapper(onRequest: (RequestOptions options, handler) {
  log('[DIO] Request: ${options.method} ${options.uri}');
  prettyLog(options.data);
  log('Headers:');
  options.headers.forEach((key, value) {
    log('|\t$key: $value');
  });
  handler.next(options); //continue
}, onResponse: (Response response, handler) async {
  log('[DIO] Response [code ${response.statusCode}]: [url ${response.realUri.toString()}] ');
  prettyLog(response.data);
  handler.next(response);
  // return response; // continue
}, onError: (DioException error, handler) async {
  log('[DIO] Error: ${error.error}: ');
  if (error.response?.data != null) {
    prettyLog(error.response?.data);
  } else {
    log(error.response.toString());
  }
  handler.next(error); //continue
});

void prettyLog(var json) {
  try {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(json);
    log(prettyprint);
  } catch (e) {}
}
