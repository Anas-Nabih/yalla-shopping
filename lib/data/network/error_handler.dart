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
  NO_INTERNET_CONNECTION
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

  /// failure, crash in server side
  static const int INTERNET_SERVER_ERROR = 500;

  /// locale status code

  static const int CONNECT_TIMEOUT = -1;

  static const int CANCEL = -2;

  static const int RECIEVE_TIMEOUT = -3;

  static const int SEND_TIMEOUT = -4;

  static const int CASHE_ERROR = -5;

  static const int NO_INTERNET_CONNECTION = -6;

  static const int UNKNOW = -7;
}

class ResponseMessage {
  /// success with data
  static const String SUCCESS = "success.";

  /// success with no data (no content)
  static const String NO_CONTENT = "success.";

  /// failure, api rejected request
  static const String BAD_REQUEST = "Bad request, try again later.";

  ///failure, user anAuthorised
  static const String UNAUTHORIZED = "your session timeout, you should login again.";

  /// failure, api rejected request
  static const String FORBIDEN = "Forbidden request, try again later.";

  /// failure, crash in server side
  static const String INTERNET_SERVER_ERROR =
      "Some thing wrong happened, try again later.";

  /// locale status code

  static const String CONNECT_TIMEOUT = "Timeout error, try again later.";

  static const String CANCEL = "Request was cancelled, try again later.";

  static const String RECIEVE_TIMEOUT = "Timeout error, try again later.";

  static const String SEND_TIMEOUT = "Timeout error, try again later.";

  static const String CASHE_ERROR = "Cash error, try again later.";

  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";

  static const String UNKNOW = "Some thing wrong happened, try again later.";
}
