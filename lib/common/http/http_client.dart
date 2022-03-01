import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as g;
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/http/loading_interceptor.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';

void showErrorDialog(DioError err) {
  String errorMessage = '未知错误';
  DialogType _hintType = DialogType.error;

  if (err.type == DioErrorType.connectTimeout ||
      err.type == DioErrorType.sendTimeout ||
      err.type == DioErrorType.receiveTimeout) {
    _hintType = DialogType.network;
  }

  switch (err.type) {
    case DioErrorType.connectTimeout:
      errorMessage = '连接超时';
      break;

    case DioErrorType.sendTimeout:
      errorMessage = '发送超时';
      break;

    case DioErrorType.receiveTimeout:
      errorMessage = '接收超时';
      break;

    case DioErrorType.cancel:
      errorMessage = '用户取消';
      break;

    default:
      if (err.response != null) {
        if (err.response!.statusCode == 400) {
          if (err.response!.data['code'] == 40000) {
            errorMessage = err.response!.data['msg'] as String;
          } else {
            errorMessage = '请求失败';
          }
        }
        if (err.response!.statusCode! >= 500) {
          errorMessage = '服务端不响应';
        }
      }
      break;
  }
  showDialogSimple(_hintType, '$errorMessage，请稍后再试。。。');
}

Dio _initDio() {
  final LoadingInterceptor _loadingInterceptor = g.Get.find();
  final LogInterceptor _logInterceptor = g.Get.find();
  final Dio _dio = Dio()
    ..options = BaseOptions(
      baseUrl: Application.globalEnv.apiGatewayBaseUrl,
      connectTimeout: Application.globalEnv.apiGatewayConnectTimeout,
    )
    ..interceptors.add(_loadingInterceptor);
  (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) {
      return true;
    };
    return client;
  };

  if (kDebugMode) {
    _dio.interceptors.add(_logInterceptor);
  }

  return _dio;
}

class HttpClient {
  final Dio _dio = _initDio();

  Future<Optional<Response>> get(String url,
      {bool loading = true, bool throwError = false}) async {
    return _dio
        .get(url, options: Options(extra: {'withoutLoading': !loading}))
        .then((response) => Optional.of(response))
        .catchError((error) {
      if (throwError) {
        throw Exception(error);
      } else {
        showErrorDialog(error as DioError);
      }
      return const Optional.empty();
    });
  }

  Future<Optional<Response>> post(String url, Map<String, dynamic> data,
      {bool loading = true, bool throwError = false}) async {
    return _dio
        .post(
          url,
          data: data,
          options: Options(extra: {'withoutLoading': !loading}),
        )
        .then((response) => Optional.of(response))
        .catchError((error) {
      if (throwError) {
        throw Exception(error);
      } else {
        showErrorDialog(error as DioError);
      }
      return const Optional.empty();
    });
  }

  Future<Optional<Response>> patch(String url, Map<String, dynamic> data,
      {bool loading = true, bool throwError = false}) async {
    return _dio
        .patch(
          url,
          data: data,
          options: Options(extra: {'withoutLoading': !loading}),
        )
        .then((response) => Optional.of(response))
        .catchError((error) {
      if (throwError) {
        throw Exception(error);
      } else {
        showErrorDialog(error as DioError);
      }
      return const Optional.empty();
    });
  }
}
