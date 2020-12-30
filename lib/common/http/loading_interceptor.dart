import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:tw_wallet_ui/service/progress_dialog.dart';

class LoadingInterceptor extends InterceptorsWrapper {
  final ProgressDialog _dialog = g.Get.find();

  @override
  Future onRequest(RequestOptions options) {
    if (options.extra['withoutLoading'] != true) {
      _dialog.show();
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    if (response.request.extra['withoutLoading'] != true) {
      _dialog.dismiss();
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    if (err.request.extra['withoutLoading'] != true) {
      _dialog.dismiss();
    }
    return super.onError(err);
  }
}
