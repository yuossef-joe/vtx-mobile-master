import 'package:applocation/app/app_preferences.dart';
import 'package:applocation/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";


class DioFactory{
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);
  Future <Dio> getDio() async{
    Dio dio = Dio();

    String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE:APPLICATION_JSON,
      ACCEPT:APPLICATION_JSON,
      //AUTHORIZATION:Constants.token.isEmpty?'Bearer ${await _appPreferences.getToken()}':Constants.token,
      DEFAULT_LANGUAGE:language,
    };

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await _appPreferences.getToken();
          if (token!=null&&token.isNotEmpty) {
            options.headers[AUTHORIZATION] = 'Bearer $token';
          }
          else{
            options.headers[AUTHORIZATION] = 'Bearer ${Constants.token}';
          }
          return handler.next(options); // continue with the request
        },
      ),
    );

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      connectTimeout: Duration(milliseconds: Constants.apiTimeOut),
      receiveTimeout: Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: Duration(milliseconds: Constants.apiTimeOut),
    );
    
    if (!kReleaseMode) { // debug mode to print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true
      ));
    }  

    return dio;
  }
}