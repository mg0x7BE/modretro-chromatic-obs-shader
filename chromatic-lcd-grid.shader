// ModRetro Chromatic LCD Grid Shader for OBS Studio (obs-shaderfilter)
// Simulates real LCD pixel grid with color enhancement
// Optional DMG (original Game Boy) green palette mode
//
// Usage:
//   1. Install obs-shaderfilter plugin
//   2. Add "User-defined shader" as Effect Filter on your SCENE (not source)
//   3. Paste this code or load from file
//
// Designed for ModRetro Chromatic USB video capture.
// Canvas should be set to an integer multiple of 160x144 (e.g. 1440x1296 = 9x).
// Source scale filtering must be set to Point (Nearest Neighbor).

uniform float grid_thickness = 0.12;
uniform float grid_opacity = 0.3;
uniform float brightness_boost = 1.4;
uniform float vibrance = 0.2;
uniform float saturation = 1.2;
uniform bool dmg_palette = false; // Use with Chromatic [Menu] > [Palette] > "Grayscale"

float4 mainImage(VertData v_in) : TARGET
{
    float4 col = image.Sample(textureSampler, v_in.uv);

    // DMG palette (original Game Boy green tints)
    if (dmg_palette)
    {
        float luma = dot(col.rgb, float3(0.299, 0.587, 0.114));

        // Original Game Boy 4 colors (darkest to lightest)
        float3 c0 = float3(0.06, 0.22, 0.06);  // darkest
        float3 c1 = float3(0.19, 0.40, 0.13);
        float3 c2 = float3(0.45, 0.58, 0.00);
        float3 c3 = float3(0.78, 0.79, 0.08);  // lightest

        float t = 0.08; // transition width (smaller = harder)

        if (luma < 0.25 - t)
            col.rgb = c0;
        else if (luma < 0.25 + t)
            col.rgb = lerp(c0, c1, (luma - 0.25 + t) / (2.0 * t));
        else if (luma < 0.5 - t)
            col.rgb = c1;
        else if (luma < 0.5 + t)
            col.rgb = lerp(c1, c2, (luma - 0.5 + t) / (2.0 * t));
        else if (luma < 0.75 - t)
            col.rgb = c2;
        else if (luma < 0.75 + t)
            col.rgb = lerp(c2, c3, (luma - 0.75 + t) / (2.0 * t));
        else
            col.rgb = c3;
    }
    else
    {
        // Saturation (only for color mode)
        float luma = dot(col.rgb, float3(0.299, 0.587, 0.114));
        col.rgb = lerp(float3(luma, luma, luma), col.rgb, saturation);

        // Vibrance (only for color mode)
        float max_c = max(col.r, max(col.g, col.b));
        float min_c = min(col.r, min(col.g, col.b));
        float sat_amount = max_c - min_c;
        col.rgb = lerp(float3(luma, luma, luma), col.rgb, 1.0 + vibrance * (1.0 - sat_amount));
    }

    // Grid
    float2 src_size = float2(160.0, 144.0);
    float2 pixel_pos = frac(v_in.uv * src_size);
    float half_t = grid_thickness * 0.5;

    if (pixel_pos.x < half_t || pixel_pos.x > (1.0 - half_t) ||
        pixel_pos.y < half_t || pixel_pos.y > (1.0 - half_t))
    {
        col.rgb = col.rgb * (1.0 - grid_opacity);
    }
    else
    {
        col.rgb = saturate(col.rgb * brightness_boost);
    }

    return col;
}
