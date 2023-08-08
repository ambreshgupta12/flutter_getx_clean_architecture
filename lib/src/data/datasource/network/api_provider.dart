import 'dart:io';

import 'package:flutter_clean_architecture/src/data/datasource/network/api_request_representable.dart';
import 'package:get/get.dart';

class APIProvider {
  APIProvider._();

  static final APIProvider _instance = APIProvider._();

  static APIProvider get instance => _instance;
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  Future request(APIRequestRepresentable representable) async {
    try {
      print('uRL:${representable.url}');
      print('uRL:${representable.method.string}');
      final response = await _client.request(representable.url, representable.method.string,
          query: representable.query, body: representable.body, headers: representable.headers);
      return _returnResponse(response);
    } on TimeOutException catch (_) {
      throw TimeOutException('Time out exception');
    } on SocketException {
      throw FetchDataException('No internet connection ');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal server error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class ApiException implements Exception {
  final String code;
  final String message;
  final String detail;
  ApiException({required this.code, required this.message, required this.detail});
}

class FetchDataException extends ApiException {
  FetchDataException(String? details)
      : super(code: 'fetch-data', message: 'Error during communication', detail: details!);
}

class BadRequestException extends ApiException {
  BadRequestException(String? details)
      : super(code: 'invalid-request', message: 'Invalid Request', detail: details!);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException(String? details)
      : super(code: 'unauthorised-exception', message: 'Unauthorised Exception', detail: details!);
}

class InvalidInputException extends ApiException {
  InvalidInputException(String? details)
      : super(code: 'invalid-input', message: 'Invalid Input', detail: details!);
}

class TimeOutException extends ApiException {
  TimeOutException(String? details)
      : super(code: 'request-timeout', message: 'Request TimeOut', detail: details!);
}

class AuthenticationException extends ApiException {
  AuthenticationException(String? details)
      : super(code: 'authenticate-failed', message: 'Authenticate Failed', detail: details!);
}
