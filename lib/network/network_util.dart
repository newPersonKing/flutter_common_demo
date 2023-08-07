
import 'package:dio/dio.dart';
import 'package:flutter_common_demo/network/print.dart';

var dio = Dio(BaseOptions(
  baseUrl: "http://120.78.146.222/"
));

class NetWorkUtil {

  /// 单例对象
  static NetWorkUtil? _instance;

  NetWorkUtil._internal();

  static NetWorkUtil get instance => _instance ??= NetWorkUtil._internal();

  _HttpTask doGet(String url,{Map<String,dynamic>? params}){

    return _HttpTask(url,"GET",params);
  }

  _HttpTask doPost(String url,{Map<String,dynamic>? params}){

    return _HttpTask(url,"POST",params);
  }

  _HttpTask doUpLoadSingleFile(String url,{Map<String,dynamic>? params}){
    return _HttpTask(url,"uploadSingleFile",params);
  }
}

class _HttpTask {

  var _url = "";
  var _method = "";
  var _isForm = true;
  var _filePath = "";
  Map<String, dynamic> queryParameters = {"sys_type":"android"};

  _HttpTask(String url,String method,Map<String,dynamic>? params){
    _url = url;
    _method = method;
    if(params!=null){
      queryParameters.addAll(params);
    }
  }

  _HttpTask key(String key,dynamic value){
    queryParameters[key] = value;
    return this;
  }

  _HttpTask isForm(bool isForm){
    _isForm = isForm;
    return this;
  }

  _HttpTask file(String path){
    _filePath = path;
    return this;
  }

  void execute({HttpSuccessCallBack? successCallBack,HttpFailCallBack? failCallBack }) async{
    try{
      printMsg("flutter_http:_url===$_url");
      Response? response;
      switch(_method){
        case "GET":
          response =  await dio.get(_url,queryParameters: queryParameters);
          break;
        case "POST":
          response =  await dio.post(_url,data: _isForm ? FormData.fromMap(queryParameters):queryParameters);
          break;
        case "uploadSingleFile":
          var partFile =  await MultipartFile.fromFile(_filePath);
          // TODO 这里的key
          queryParameters["img"] = partFile;
          response = await dio.post(_url,data: FormData.fromMap(queryParameters));
          break;
      }
      if(response !=null){
        printMsg("flutter_http:response:"+response.data.toString());
        successCallBack?.call(response);
      }else {
        printMsg("flutter_http:response:请求方式错误或者返回结果为null");
      }
    }on Exception catch (error){
      failCallBack?.call(error);
      printMsg("flutter_http_error==${error.toString()}");
    }
  }
}

typedef HttpSuccessCallBack = void Function(Response value);

typedef HttpFailCallBack = void Function(Exception value);

