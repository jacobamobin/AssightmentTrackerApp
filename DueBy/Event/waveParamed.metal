//
//  waveParamed.metal
//  DueBy
//
//  Created by Jacob Mobin on 2024-12-05.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 complexWave(float2 position, float time, float speed, float frequency, float strength, float2 size) {
    float2 normalizedPosition = position / size;
    float moveAmount = time * speed;

    position.x += sin((normalizedPosition.x + moveAmount) * frequency) * strength;
    position.y += cos((normalizedPosition.y + moveAmount) * frequency) * strength;

    return position;
}
