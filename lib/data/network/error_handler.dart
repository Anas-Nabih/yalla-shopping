import 'package:dio/dio.dart';
import 'package:yalla_shopping/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSource.UNKNOWN.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            code: error.response?.statusCode ?? 0,
            message: error.response?.statusMessage ?? "");
      } else {
        return DataSource.UNKNOWN.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.other:
      return DataSource.UNKNOWN.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNET_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CASHE_ERROR,
  NO_INTERNET_CONNECTION,
  UNKNOWN
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(
            code: ResponseCode.SUCCESS, message: ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(
            code: ResponseCode.NO_CONTENT, message: ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDEN:
        return Failure(
            code: ResponseCode.FORBIDEN, message: ResponseMessage.FORBIDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(
            code: ResponseCode.UNAUTHORIZED,
            message: ResponseMessage.UNAUTHORIZED);
      case DataSource.NOT_FOUND:
        return Failure(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNET_SERVER_ERROR:
        return Failure(
            code: ResponseCode.INTERNET_SERVER_ERROR,
            message: ResponseMessage.INTERNET_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(
            code: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            code: ResponseCode.RECIEVE_TIMEOUT,
            message: ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CASHE_ERROR:
        return Failure(
            code: ResponseCode.CASHE_ERROR,
            message: ResponseMessage.CASHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.UNKNOWN:
        return Failure(
            code: ResponseCode.UNKNOWN, message: ResponseMessage.UNKNOWN);
    }
  }
}

class ResponseCode {
  /// success with data
  static const int SUCCESS = 200;

  /// success with no data (no content)
  static const int NO_CONTENT = 201;

  /// failure, api rejected request
  static const int BAD_REQUEST = 400;

  ///failure, user anAuthorised
  static const int UNAUTHORIZED = 401;

  /// failure, api rejected request
  static const int FORBIDEN = 403;

  /// no data found
  static const int NOT_FOUND = 404;

  /// failure, crash in server side
  static const int INTERNET_SERVER_ERROR = 500;

  /// locale status code

  static const int CONNECT_TIMEOUT = -1;

  static const int CANCEL = -2;

  static const int RECIEVE_TIMEOUT = -3;

  static const int SEND_TIMEOUT = -4;

  static const int CASHE_ERROR = -5;

  static const int NO_INTERNET_CONNECTION = -6;

  static const int UNKNOWN = -7;
}

class ResponseMessage {
  /// success with data
  static const String SUCCESS = "success.";

  /// success with no data (no content)
  static const String NO_CONTENT = "success.";

  /// failure, api rejected request
  static const String BAD_REQUEST = "Bad request, try again later.";

  ///failure, user anAuthorised
  static const String UNAUTHORIZED =
      "your session timeout, you should login again.";

  /// failure, api rejected request
  static const String FORBIDEN = "Forbidden request, try again later.";

  static const String NOT_FOUND = "No data found, try again later.";

  /// failure, crash in server side
  static const String INTERNET_SERVER_ERROR =
      "Some thing wrong happened, try again later.";

  /// locale status code

  static const String CONNECT_TIMEOUT = "Timeout error, try again later.";

  static const String CANCEL = "Request was cancelled, try again later.";

  static const String RECIEVE_TIMEOUT = "Timeout error, try again later.";

  static const String SEND_TIMEOUT = "Timeout error, try again later.";

  static const String CASHE_ERROR = "Cash error, try again later.";

  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";

  static const String UNKNOWN = "Some thing wrong happened, try again later.";
}

class ApiInternalStatus{
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
