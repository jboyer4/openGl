#version 330 compatibility
out vec3 vColor;
out vec2 vSt;
out vec3 vN;
out vec3 vL;
out vec3 vE;
out vec4 viewVert;
uniform vec3 ulightPosition;
uniform float vTime;


void main( ){
	vSt=gl_MultiTexCoord0.st;
	vec4 ECposition = gl_ModelViewMatrix * gl_Vertex;
	vN = normalize( gl_NormalMatrix * gl_Normal );

	vec4 adjustedLightPos = gl_ModelViewMatrix * vec4(ulightPosition, 1.);
	vL = adjustedLightPos.xyz - ECposition.xyz;

	vE = vec3(0.,0.,0.) - ECposition.xyz;

	vec4 vert = gl_Vertex;
	if(vTime > 0.5){
		if(vert.x > vert.y){
			if(vert.x > vert.x){
				vert.z = vert.z+2*vTime;
			}
			else{
				vert.x = vert.x-vTime;
			}
		}
		else{
			if(vert.x > vert.y){
				vert.x = vert.x+3*vTime;
			}
			else{
				vert.z = vert.z-2*vTime;
			}
		}
	}
	else{
		if(vert.x > vert.y){
			if(vert.x > vert.x){
				vert.z = vert.z+2*(1-vTime);
			}
			else{
				vert.x = vert.x-(1-vTime);
			}
		}
		else{
			if(vert.x > vert.y){
				vert.x = vert.x+3*(1-vTime);
			}
			else{
				vert.z =vert.z-2*(1-vTime);
			}
		}
	}
	viewVert =  vert;
	gl_Position =gl_ModelViewProjectionMatrix * vert;
}