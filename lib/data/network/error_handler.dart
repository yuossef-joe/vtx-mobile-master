import 'package:applocation/data/network/failure.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';


class ErrorHandler implements Exception{
  late Failure failure;

  ErrorHandler.handle(dynamic error){
    if (error is DioException) {
      failure = _handleError(error);
    }else{
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error){
  switch (error.type){
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badCertificate:
      if (error.response != null && error.response?.statusMessage!= null && error.response?.statusCode!=null) {
        return Failure(error.response?.statusMessage ?? "");
      }else{
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.badResponse:
      if (error.response != null && error.response?.statusMessage!= null && error.response?.statusCode!=null) {
        return Failure(error.response?.statusMessage ?? "");
      }else{
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      if (error.response != null && error.response?.statusMessage!= null && error.response?.statusCode!=null) {
        return Failure( error.response?.statusMessage ?? "");
      }else{
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

extension DataSourceExtension on DataSource {
  Failure getFailure(){
    switch (this){

      case DataSource.SUCCESS:
        return Failure(ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure( ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure( ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure( ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure( ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure( ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseMessage.CASHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseMessage.NO_INTERNET_CONNECTION);
        case DataSource.DEFAULT:
        return Failure(ResponseMessage.NO_INTERNET_CONNECTION);
    }
  }
}

class ResponseCode{
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success without data
  static const int BAD_REQUEST = 400; // API rejected request
  static const int UNAUTHORISED = 401; // user is not authorised
  static const int FORBIDDEN = 403; // API rejected request
  static const int NOT_FOUND = 404; //
  static const int INTERNAL_SERVER_ERROR = 500; // crash in server side

  // Local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CASHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage{
  static  String SUCCESS = AppStrings.success.tr();
  static  String NO_CONTENT = AppStrings.noContent.tr();
  static  String BAD_REQUEST = AppStrings.badRequestError.tr();
  static  String UNAUTHORISED = AppStrings.unauthorizedError.tr();
  static  String FORBIDDEN = AppStrings.forbiddenError.tr();
  static  String NOT_FOUND = AppStrings.notFoundError.tr();
  static  String INTERNAL_SERVER_ERROR = AppStrings.internalServerError.tr();

  // Local status code
  static  String CONNECT_TIMEOUT = AppStrings.timeoutError.tr();
  static  String CANCEL = AppStrings.cancelError.tr();
  static  String RECIEVE_TIMEOUT = AppStrings.timeoutError.tr();
  static  String SEND_TIMEOUT = AppStrings.timeoutError.tr();
  static  String CASHE_ERROR = AppStrings.cacheError.tr();
  static  String NO_INTERNET_CONNECTION = AppStrings.noInternetError.tr();
  static  String DEFAULT = AppStrings.unknownError.tr();
}

class ApiInternalStatus {
  static const String SUCCESS = "success";
  static const int FALIURE = 1;
}
