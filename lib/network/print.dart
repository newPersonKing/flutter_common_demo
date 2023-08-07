

import 'package:flutter/foundation.dart';

void printMsg(String message){
  if(kDebugMode){
    print("flutter_msg:"+message);
  }
}