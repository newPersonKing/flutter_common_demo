#version 460 core
precision mediump float;
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
out vec4 fragColor;

//void main() {
//  vec2 coo = FlutterFragCoord().xy / uSize;
//  float shadowPercent = 0.2;
//  if(coo.x <= shadowPercent || coo.y <= shadowPercent || coo.x >= (1 - shadowPercent) || coo.y >= 1-shadowPercent){
//    float dis = 0.0;
//    if(coo.x > shadowPercent && coo.x < (1-shadowPercent) && coo.y < shadowPercent){
//      dis = coo.y;
//    }else if(coo.x > shadowPercent && coo.x < (1-shadowPercent) && coo.y > (1-shadowPercent)){
//      dis = 1- coo.y;
//    }else if(coo.y > shadowPercent && coo.y < (1-shadowPercent) && coo.x < shadowPercent){
//      dis = coo.x;
//    }else if(coo.y > shadowPercent && coo.y < (1-shadowPercent) && coo.x > (1-shadowPercent)){
//      dis = 1 - coo.x;
//    }else if((coo.x < shadowPercent && coo.y < shadowPercent)){
//      dis = min(coo.x,coo.y);
//    }else if((coo.x > (1-shadowPercent) && coo.y < shadowPercent)){
//      dis = min((1-coo.x),coo.y);
//    }else if (coo.x > (1-shadowPercent) && coo.y > (1-shadowPercent)){
//      dis = min(1-coo.x,1-coo.y);
//    }else if (coo.x < (shadowPercent) && coo.y > (1-shadowPercent)){
//      dis = min(coo.x,1-coo.y);
//    }
//    float alpha = 1 - (dis / shadowPercent);
//    fragColor = vec4(0, 120, 0, 255 * alpha) / 255;
//  }else {
//    fragColor = vec4(0, 0, 0, 0) / 255;
//  }
//}

void main() {
  vec2 coo = FlutterFragCoord().xy / uSize;
  float shadowWidth = 20;
  float x = FlutterFragCoord().x;
  float y = FlutterFragCoord().y;
  float width = uSize[0];
  float height = uSize[1];
  if(x <= shadowWidth || x > width - shadowWidth  || y < shadowWidth || y >= height - shadowWidth){
    float dis = 0.0;
    if( x >  shadowWidth && x < (width-shadowWidth) && y < shadowWidth){
      dis = y;
    }else if(x > shadowWidth && x < ( width -shadowWidth) && y > (height - shadowWidth)){
      dis = height - y;
    }else if(y > shadowWidth && y < (height -shadowWidth) && x < shadowWidth){
      dis = x;
    }else if( y > shadowWidth && y < (height - shadowWidth) && x > (width - shadowWidth)){
      dis = width - x;
    }else if((x < shadowWidth && y < shadowWidth)){
      dis = min(x,y);
    }else if((x > ( width -shadowWidth) && y < shadowWidth)){
      dis = min(width - x,y);
    }else if (x > (width - shadowWidth) && y > height - shadowWidth){
      dis = min(width -  x,height - y);
    }else if (x < shadowWidth && y > height -shadowWidth){
      dis = min(x,height - y);
    }
    float alpha = 1 - (dis / shadowWidth);
    fragColor = vec4(0, 120, 0, 255 * alpha) / 255;
  }else {
    fragColor = vec4(0, 0, 0, 0) / 255;
  }
}