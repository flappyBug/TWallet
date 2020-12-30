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

  if (err.type == DioErrorType.CONNECT_TIMEOUT ||
      err.type == DioErrorType.SEND_TIMEOUT ||
      err.type == DioErrorType.RECEIVE_TIMEOUT) {
    _hintType = DialogType.network;
  }

  switch (err.type) {
    case DioErrorType.CONNECT_TIMEOUT:
      errorMessage = '连接超时';
      break;

    case DioErrorType.SEND_TIMEOUT:
      errorMessage = '发送超时';
      break;

    case DioErrorType.RECEIVE_TIMEOUT:
      errorMessage = '接收超时';
      break;

    case DioErrorType.CANCEL:
      errorMessage = '用户取消';
      break;

    default:
      if (err.response != null) {
        if (err.response.statusCode == 400) {
          if (err.response.data['code'] == 40000) {
            errorMessage = err.response.data['msg'] as String;
          } else {
            errorMessage = '请求失败';
          }
        }
        if (err.response.statusCode >= 500) {
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
        .post(url,
            data: data, options: Options(extra: {'withoutLoading': !loading}))
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
