#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double outputWave[128];


int main(int argc, char *argv[]) {
	for (int i=0;i<128;i++){
		outputWave[i]=sin(i/128);
		printf("%x \n",outputWave[i]);
		}
}
