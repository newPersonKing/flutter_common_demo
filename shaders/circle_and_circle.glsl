#version 460 core
#include <flutter/runtime_effect.glsl>

out vec4 fragColor;
uniform vec2 fragCoord;
uniform float iTime;
void main()
{
    vec2 cp = fragCoord - (FlutterFragCoord().xy / 2.0);
    float d = length(cp);
    float grey = 0.5 + 100.0 * cos(d / 10.0 - iTime * 5.0) / (d *3.0 + 5.0);
    fragColor = vec4(grey, grey, grey, 1.0);
}