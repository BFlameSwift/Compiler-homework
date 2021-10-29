#include<stdio.h>
int main() {
    int f = 5;
    const int s = f +1;
    printf("%d",s-f);
    return 0;
}