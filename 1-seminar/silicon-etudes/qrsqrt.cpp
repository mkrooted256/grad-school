#include <iostream>
#include <cstdio>
using namespace std;

void float_research() {
    long m = 0;
    long e = 0;

    float one = 1.f;
    printf("%g - %x\n\n", one, *(long*)&one);

    for (int i=-15; i<16; i++) {
        printf("%2d | ", i);
        for (int j=-15; j<16; j++) {
            printf("%g (0x%x) | ", x, *(long*)&x); 
        }
    }
}

int main() {
    const long magic = 0x5f3759df;

    float x = 0.625;
    long i;

    i = *(long*) &x;
    

}