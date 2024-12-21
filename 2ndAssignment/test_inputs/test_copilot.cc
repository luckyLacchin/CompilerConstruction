// Test function definitions
int add(int a, int b) {
    return a + b;
}

double convert(int a) {
    return a;
}

// Test struct definitions
struct Point {
    int x;
    int y;
};

struct ColoredPoint : Point {
    int color;
};

// Test return statements
int returnTest() {
    return 5;
}

void returnVoidTest() {
    return;
}

// Test while loop
void whileTest() {
    int a = 0;
    while (a < 5) {
        a++;
    }
}

// Test do-while loop
void doWhileTest() {
    int a = 0;
    do {
        a--;
    } while (a > 0);
}

// Test for loop
void forTest() {
    int a = 0;
    int i = 0;
    for (i = 0; i < 5; i++) {
        a = i;
    }
}

// Test block of statements
void blockTest() {
    int a = 0;
    int b = 2;
    {
        int temp = a;
        a = b;
        b = temp;
    }
}

// Test if-else statement
void ifElseTest() {
    int a = 5;
    int b = 3;
    if (a > b) {
        a--;
    } else {
        b--;
    }
}

// Test try-catch statement
void tryCatchTest() {
    exception a;
    try throw a; catch (exception e) {
        exception a = e;
    }
}