/*originals https://www.shadertoy.com/view/Wl3fzM https://www.shadertoy.com/view/lclSWH https://www.shadertoy.com/view/lslyRn*/
#include <flutter/runtime_effect.glsl>

// Copyright Inigo Quilez, 2013 - https://iquilezles.org/
// I am the sole copyright owner of this Work.
// You cannot host, display, distribute or share this Work neither
// as it is or altered, here on Shadertoy or anywhere else, in any
// form including physical and digital. You cannot use this Work in any
// commercial or non-commercial product, website or project. You cannot
// sell this Work and you cannot mint an NFTs of it or train a neural
// network with it without permission. I share this Work for educational
// purposes, and you can link to it, through an URL, proper attribution
// and unmodified screenshot, as part of your educational material. If
// these conditions are too restrictive please contact me and we'll
// definitely work it out.

// Shading technique explained here:
//
// https://iquilezles.org/articles/voxellines

out vec4 fragColor;
uniform vec2 fragCoord;
uniform float iTime;

/*
    Copyright 2024 - Daniel Oren-Ibarra
    Listed under GNU - GPL license: https://www.gnu.org/licenses/gpl-3.0.en.html
    This software may be used, modified and distributed in any manner,
    so long as the source code remains public.


    Previous versions and feature developments of this shader
===================================================================
    Black Hole Raymarcher 2: https://www.shadertoy.com/view/4XjGzz
    Black Hole Raymarcher 1: https://www.shadertoy.com/view/M3lGD4
    Spiral accretion disk field: https://www.shadertoy.com/view/43lGRj
    Fast 3d noise fog: https://www.shadertoy.com/view/XXj3Rz
*/
const int doBloom = 1; //Change to 0 to disable bloom
void main()
{
    vec2  iResolution = FlutterFragCoord().xy;
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    vec3 col = texture(iChannel0, uv).rgb;
    if(doBloom == 1)
    {
        vec3 bloom = textureLod(iChannel0, uv, 2.0).rgb;
        bloom = pow(bloom, vec3(3.0));
        col += bloom;
    }



    // Output to screen
    fragColor = vec4(col,1.0);
}