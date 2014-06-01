#version 150

// these are for the programmable pipeline system and are passed in
// by default from OpenFrameworks
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform mat4 textureMatrix;
uniform mat4 modelViewProjectionMatrix;

const float magnitude = 0.25;

vec4 pixel;


in vec4 position;
in vec4 color;
in vec4 normal;
in vec2 texcoord;
// this is the end of the default functionality

// this is something we're creating for this shader
out vec2 varyingtexcoord;

uniform sampler2DRect tex0;

float dv;

vec4 displace;


void main()
{
    // here we move the texture coordinates
    //varyingtexcoord = vec2(texcoord.x, texcoord.y);
    varyingtexcoord = texcoord;
    
    //pixel = texture2D(varyingtexcoord, color);
	//float dv = (pixel.r + pixel.g + pixel.b) / 3.0;
	//dv = dv * magnitude;
    
    pixel = texture(tex0, texcoord);
    
    dv = (pixel.r + pixel.g + pixel.b) / 3.0;
    
    dv = dv * magnitude;
    
	displace = vec4(normalize(normal) * dv);


    
    

    
    // send the vertices to the fragment shader
    //gl_Position = modelViewProjectionMatrix * position;
    gl_Position = modelViewProjectionMatrix * (position + displace);

}