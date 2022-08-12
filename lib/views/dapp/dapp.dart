import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tw_wallet_ui/common/dapp_list.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/service/dapp.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DAppPage extends StatefulWidget {
  final String id;
  const DAppPage({required this.id});

  @override
  State<StatefulWidget> createState() {
    return DAppPageState();
  }
}

class DAppPageState extends State<DAppPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoadingPage = true;
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    DAppService.dappPageStateInstance = this;
    DAppService.setStatusBarMode('id', 'dark');
  }

  DAppInfo getDappById(String? id) {
    return dappList.firstWhere((dapp) => dapp.id == id);
  }

  JavascriptChannel _nativeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'TWalletNative',
      onMessageReceived: (JavascriptMessage message) {
        try {
          final Map<String, dynamic>? requestJson =
              jsonDecode(message.message) as Map<String, dynamic>?;
          final WebviewRequest webviewRequest =
              WebviewRequest.fromJson(requestJson);
          DAppService.getOperator(webviewRequest.method)
              .call(webviewRequest.id, webviewRequest.param);
        } catch (e) {
          _controller.future.then(
            (webviewController) => webviewController.runJavascript(
              'window.TWallet.rejectPromise(${json.encode(json.encode(e.toString()))});',
            ),
          );
        }
      },
    );
  }

  Future<bool> onBack() async {
    if (!_controller.isCompleted) {
      resetToAppStatusBar();
      return true;
    }
    final webViewController = await _controller.future;
    webViewController.runJavascript('window.TWallet.emit("BACK");');
    return false;
  }

  void finishLoading() {
    setState(() {
      isLoadingPage = false;
    });
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  void resetToAppStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: WalletColor.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBack,
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: Theme(
          data: Theme.of(context),
          child: Container(
            height: DeviceInfo.isIphoneXSeries() ? 34 : 0,
            color: WalletColor.white,
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Builder(
                builder: (BuildContext context) {
                  return WebView(
                    initialUrl: getDappById(widget.id).url,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                      DAppService.webviewController = webViewController;
                      DAppService.dappid = widget.id;
                    },
                    javascriptChannels: <JavascriptChannel>{
                      _nativeJavascriptChannel(context),
                    },
                    onPageStarted: (String url) {
                      _controller.future.then((webViewController) {
                        webViewController.runJavascript(
                          'window._wallet_dapp_id = ${json.encode(widget.id)}',
                        );
                      });
                    },
                    onPageFinished: (String url) {
                      finishLoading();
                      // _controller.future.then((webViewController) {
                      //   webViewController.evaluateJavascript(
                      //       'document.body.style.overflow = "hidden";');
                      // });
                    },
                    gestureNavigationEnabled: true,
                  );
                },
              ),
              if (isLoadingPage)
                Container(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      WalletColor.primary,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
