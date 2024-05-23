#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

// Function to map a value to a color in the rainbow spectrum
vec3 rainbow(float value) {

    // Convert range to [0.0, 6.0] (7 colors in rainbow)
    float f = value * 6.0;
    float x = f - floor(f);

    vec3 result;

    // red to yellow
    if (f < 1.0) {
        result = vec3(1.0, x, 0.0);
    // yellow to green
    } else if (f < 2.0) {
        result = vec3(1.0 - x, 1.0, 0.0);
    // green to cyan
    } else if (f < 3.0) {
        result = vec3(0.0, 1.0, x);
    // cyan to blue
    } else if (f < 4.0) {
        result = vec3(0.0, 1.0 - x, 1.0);
    // blue to magenta
    } else if (f < 5.0) {
        result = vec3(x, 0.0, 1.0);
    // magenta to red
    } else {
        result = vec3(1.0, 0.0, 1.0 - x);
    }

    return result;
}

void main() {
    // Sample original color from texture
    vec4 color = texture(image, model_uv);

    // Calculate luminance of original color
    float luminance = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    // Map luminance to rainbow spectrum
    vec3 rainbowColor = rainbow(luminance);

    // Set output to rainbow color with original alpha
    FragColor = vec4(rainbowColor, color.a);
}