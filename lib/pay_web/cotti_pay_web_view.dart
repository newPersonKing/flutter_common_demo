import 'dart:convert';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 8:30 PM
class CottiPayWebView extends StatefulWidget {
  String url;

  CottiPayWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<CottiPayWebView> createState() => _CottiPayWebViewState();
}

class _CottiPayWebViewState extends State<CottiPayWebView> {
  late final WebViewController _webViewController;
  final WebViewCookieManager cookieManager = WebViewCookieManager();
  String? title;
  bool isShowLoading = true;
  StringBuffer imageBase64Buff = StringBuffer();

  @override
  void initState() {
    super.initState();
    _initController();
  }

  _initController() {
    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();
    _webViewController = WebViewController.fromPlatformCreationParams(params);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _setCookie();
      _webViewController
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(onPageFinished: _onPageFinished,onWebResourceError: (error){
          },onProgress: (progress){
          }),
        )
        ..addJavaScriptChannel("PayStart",onMessageReceived:_onPayStart);
      _webViewController.loadRequest(Uri.parse("http://192.168.99.151:8080/adyen_index.html?model=card&moneyNum=10000&currency=USD&cardType=visa"));
    });
  }

  void _onPayStart(JavaScriptMessage javaScriptMessage) async{
    //模拟网络请求
    Future.delayed(const Duration(seconds: 5));
    var res = {"a":1,"b":2};
    var jsonStr = json.encode(res);
    _webViewController.runJavaScript("payFinish('"+jsonStr+"')");
  }

  @override
  Widget build(BuildContext context) {
    return _buildWebView();
  }

  Widget _buildWebView() {
    return WebViewWidget(controller: _webViewController);
  }

  _onPageFinished(url) async {
    isShowLoading = false;
    title = await _webViewController.getTitle();
    setState(() {});
  }

  _setCookie() async {
    await cookieManager.setCookie(
      const WebViewCookie(
        name: 'appToken',
        value: '11111',
        domain: "",
      ),
    );
  }

}
