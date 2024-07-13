#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

void greet() {
    printf("Hello, world!\n");
}

int main() {
    int result = add(5, 3);
    greet();
    
    return 0;
}

