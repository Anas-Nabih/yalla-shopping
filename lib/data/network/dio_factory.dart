import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:yalla_shopping/common_utils/preferences/prefs.dart';
import 'package:yalla_shopping/common_utils/res/CONST.dart';
import 'package:yalla_shopping/data/api.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String LANGUAGE = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    String language = await Prefs.getAppLocal();

    Map<String, String> header = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      AUTHORIZATION: Const.token,
      LANGUAGE: language
    };

    dio.options = BaseOptions(
      baseUrl: Api.baseUrl,
      headers: header,
      sendTimeout: Const.apiTimeOut,
      receiveTimeout: Const.apiTimeOut,
    );

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
