precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

const float Strength = float(0.35);
const float u_grain_amount = float(1.5);

float rand(vec2 co){
  return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

vec4 grain(vec4 fragColor, vec2 uv){
  vec4 color = fragColor;
  float diff = (rand(uv) - 0.0) * u_grain_amount;
  color.r += diff;
  color.g += diff;
  color.b += diff;
  return color;
}

void main() {
    vec4 pixColor = texture2D(tex, v_texcoord);
    vec3 color = vec3(pixColor[0], pixColor[1], pixColor[2]);

    // vec3 VIB_coefLuma = vec3(0.333333, 0.333334, 0.333333); // was for `if VIB_LUMA == 1`
    vec3 VIB_coefLuma = vec3(0.212656, 0.715158, 0.072186); // try both and see which one looks nicer.

    float luma = dot(VIB_coefLuma, color);

    float max_color = max(color[0], max(color[1], color[2]));
    float min_color = min(color[0], min(color[1], color[2]));

    float color_saturation = max_color - min_color;

    vec3 p_col = vec3(vec3(vec3(vec3(sign(Strength) * color_saturation) - 1.0) * Strength) + 1.0);

    pixColor[0] = mix(luma, color[0], p_col[0]);
    pixColor[1] = mix(luma, color[1], p_col[1]);
    pixColor[2] = mix(luma, color[2], p_col[2]);

    vec4 grain = grain(pixColor, v_texcoord/ 2.0);

    gl_FragColor = mix(pixColor, grain, 0.05);
}

// vim: ft=glsl
