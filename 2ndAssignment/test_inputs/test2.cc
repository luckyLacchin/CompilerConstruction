struct test2 : exception
{
    int affe;
    int hund;
};


int main () {
    int a = 2;
    int b = 3;
}

void foo(int a, int b) {
    int c = 2;
    int d = 3;
    c = c + d;

    if (c > d) {
        bool e = c > d;
    } else {
        bool e = c < d;
    }

    test2 test;

    test.affe = 1;

    throw test;
}