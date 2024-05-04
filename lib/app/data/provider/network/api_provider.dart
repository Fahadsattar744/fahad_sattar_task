import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/src/media_type.dart' as m;
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import '../../../app_constant/App_colors.dart';
import '../../../app_constant/global_var.dart';
import 'api_endpoint.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
      followRedirects: true,
      maxRedirects: 3,
      connectTimeout: 60 * 1000,
      // 60 seconds
      receiveTimeout: 60 * 1000));

  APIProvider() {
    _client.interceptors.add(DioLogInterceptor());
  }

  Future baseGetAPI(url, auth, context,
      {successMsg, loading, bool direct = false, String? fullUrl}) async {
    try {
      Response response;
      if (auth == null || auth == true) {
        response = await _client.get(fullUrl ?? (APIEndpoint.baseUrl + url),
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}"
            }));
      } else {
        response = await _client.get(fullUrl ?? (APIEndpoint.baseUrl + url),
            options: Options(
                headers: <String, String>{'Content-Type': 'application/json'}));
      }
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        return _returnResponse(e.response!);
      } else {
        return "No internet connection";
      }
    }
  }

  Future checkStatusAPI(url, auth, context,
      {successMsg, loading, bool direct = false, String? fullUrl}) async {
    try {
      Response response;
      if (auth == null || auth == true) {
        response = await _client.get(fullUrl ?? (APIEndpoint.baseUrl + url),
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}"
            }));
      } else {
        response = await _client.get(fullUrl ?? (APIEndpoint.baseUrl + url),
            options: Options(
                headers: <String, String>{'Content-Type': 'application/json'}));
      }
      return response.statusCode;
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response?.data.runtimeType == String) {
        if (e.response?.data.contains("limit")) {
          return e.response?.statusCode;
        } else {
          return e.response?.statusCode;
        }
      } else {
        return e.response?.statusCode;
      }
    }
  }

  Future basePostAPI(url, body, auth, context,
      {successMsg, loading, bool direct = false, fullUrl}) async {
    ProgressDialog pr;
    pr = ProgressDialog(
      context: context,
    );
    if (loading == true && loading != null) {
        pr.show(
            msg: "Please Wait...",
            progressType: ProgressType.normal,
            msgColor: AppColors.secondary,
            msgTextAlign: TextAlign.left,
            progressValueColor:AppColors.secondary,
            progressBgColor:AppColors.black,
            valuePosition: ValuePosition.center,
            msgFontSize: 14,
            max: 100);
    }
    try {
      Response response;
      if (auth == null || auth == true) {
        response = await _client.post(fullUrl ?? (APIEndpoint.baseUrl + url),
            data: body,
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}",
            }));
      } else {
        response = await _client.post(fullUrl ?? (APIEndpoint.baseUrl + url),
            data: body,
            options: Options(
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                }));
      }
      pr.close();
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      pr.close();
      if (e.response?.data.runtimeType == String) {
        pr.close();
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          pr.close();
          // Utils().showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        pr.close();
        return e.response?.data;
      }
    }
  }


  Future basePutAPI(url, body, auth, context,
      {successMsg, loading, bool direct = false, fullUrl}) async {
    try {
      Response response;
      if (auth == null || auth == true) {
        response = await _client.patch(fullUrl ?? (APIEndpoint.baseUrl + url),
            data: body,
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}"
            }));
      } else {
        response = await _client.put(fullUrl ?? (APIEndpoint.baseUrl + url),
            data: body,
            options: Options(
                headers: <String, String>{'Content-Type': 'application/json'}));
      }
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response?.data.runtimeType == String) {
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          // Utils.showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        return e.response?.data;
      }
    }
  }

  Future baseDeleteAPI(url, body, auth, context,
      {successMsg, loading, bool direct = false}) async {
    try {
      Response response;
      if (auth == null || auth == true) {
        response = await _client.delete(APIEndpoint.baseUrl + url,
            data: body,
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'authorization': "Bearer ${Globals.authToken}"
            }));
      } else {
        response = await _client.delete(APIEndpoint.baseUrl + url,
            data: body,
            options: Options(
                headers: <String, String>{'Content-Type': 'application/json'}));
      }
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response?.data.runtimeType == String) {
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          // Utils.showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        return e.response?.data;
      }
    }
  }

  Future baseMultiPartAPI(url, body, auth, context, File file,
      {successMsg,
      loading,
      bool direct = false,
      Function(int sent, int total)? progress}) async {
    String fileName = file.path.split("/").last;
    try {
      FormData? formData;
      _client.options.headers
          .addAll({"authorization": "Bearer ${Globals.authToken}"});
      Response response;
      formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path,
            filename: fileName,
            contentType:
                m.MediaType('image', fileName.split(".").last.toLowerCase())),
      });
      response = await _client.post(
        APIEndpoint.baseUrl + url,
        data: formData,
        onSendProgress: (int sent, int total) {
          if (progress != null) {
            progress(sent, total);
          }
        },
      );

      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response?.data.runtimeType == String) {
        if (e.response?.data.contains("limit")) {
          return null;
        } else {
          // Utils.showBottomSheetWidget();
          return {"statusCode": 401};
        }
      } else {
        return e.response?.data;
      }
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        // refreshToken();
        // _client.close();
        // token issue
        throw BadRequestException(response.data.toString());
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
