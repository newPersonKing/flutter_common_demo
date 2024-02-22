#version 460 core
#include <flutter/runtime_effect.glsl>

#define iterations 17
#define formuparam 0.53

#define volsteps 20
#define stepsize 0.1

#define zoom   0.800
#define tile   0.850
#define speed  0.000

#define brightness 0.0015
#define darkmatter 0.300
#define distfading 0.730
#define saturation 0.850

out vec4 fragColor;
uniform vec2 fragCoord;
uniform float iTime;


void mainVR( out vec4 fragColor, in vec2 fragCoord, in vec3 ro, in vec3 rd )
{
    //get coords and direction
    vec3 dir=rd;
    vec3 from=ro;

    //volumetric rendering
    float s=0.1,fade=1.;
    vec3 v=vec3(0.);
    for (int r=0; r<volsteps; r++) {
        vec3 p=from+s*dir*.5;
        p = abs(vec3(tile)-mod(p,vec3(tile*2.))); // tiling fold
        float pa,a=pa=0.;
        for (int i=0; i<iterations; i++) {
            p=abs(p)/dot(p,p)-formuparam; // the magic formula
            a+=abs(length(p)-pa); // absolute sum of average change
            pa=length(p);
        }
        float dm=max(0.,darkmatter-a*a*.001); //dark matter
        a*=a*a; // add contrast
        if (r>6) fade*=1.2-dm; // dark matter, don't render near
        //v+=vec3(dm,dm*.5,0.);
        v+=fade;
        v+=vec3(s,s*s,s*s*s*s)*a*brightness*fade; // coloring based on distance
        fade*=distfading; // distance fading
        s+=stepsize;
    }
    v=mix(vec3(length(v)),v,saturation); //color adjust
    fragColor = vec4(v*.02,1.);
}
float rich_happy_healthy_star(vec2 uv, float anim)
{
    uv = abs(uv);
    vec2 pos = min(uv.xy/uv.yx, anim);
    float p = (2.0 - pos.x - pos.y);
    return (2.0+p*(p*p-1.5)) / (uv.x+uv.y);
}
void main()
{
    vec2  iResolution = FlutterFragCoord().xy;
    //get coords and direction
    vec2 uv=fragCoord.xy/iResolution.xy-.5;
    vec2 uv2=fragCoord.xy/iResolution.xy-.5;
    uv*=fract(iTime*0.05);
    uv.y*=iResolution.y/iResolution.x;
    vec3 dir=vec3(uv*zoom,cos(iTime*0.011));
    float time=iTime*speed+.25;

    float mr = min(iResolution.x, iResolution.y);

    vec2 cp = fragCoord - (iResolution.xy / 2.0);
    float d2 = length(cp);
    float grey = 0.5 + 10.0 * cos(d2 / 10.0 - iTime * 5.0) / (d2 *3.0 + 5.0);
    vec4  fragColor2 = vec4(grey, grey, grey, 1.0);
    float d = -iTime * 0.5;
    float a = 0.0;
    for (float i = 0.0; i < 8.0; ++i) {
        a += cos(i - d - a * uv2.x);
        d += sin(uv2.y * i + a);
    }
    d += iTime * 0.5;
    vec3 col = vec3(cos(uv2 * vec2(d, a)) * 0.6 + 0.4, cos(a + d) * 0.5 + 0.5);
    col = cos(col * cos(vec3(d, a, 2.5)) * 0.5 + 0.5);



    vec3 from=vec3(1.,.5,0.5)* fragColor2.xyz;


    mainVR(fragColor, fragCoord, from, dir);
    uv2 *= 2.0 * ( cos(iTime * 2.0) -2.5); // scale
    float anim = sin(iTime * 12.0) * 0.1 + 1.0;  // anim between 0.9 - 1.1
    fragColor+= vec4(rich_happy_healthy_star(uv2, anim) * vec3(0.75,0.5,0.55)*0.2, 1.0);
    fragColor/= vec4(col,1.);
}