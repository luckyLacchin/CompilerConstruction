struct EXC : exception {
    int error_code;
};

int main () {
    int i;
    double d;
    bool b;
    exception e;
    EXC ex;

    b = true;
    b = false;
    i = -1;
    d = -1.0;
    ex = ex;

    i = main();

    i = ex.error_code;

    i = i++;
    i = i--;

    i = ++i;
    i = --i;
    i = +i;
    i = -i;

    d = i * d;
    d = i / d;
    d = i + d;
    d = i - d;
    i = d <=> d;
    b = i < d;
    b = i > d;
    b = i <= d;
    b = i >= d;
    b = i == d;
    b = i != d;
    b = b && b;
    b = b || b;
    i = i;
    d = b ? i : d;
    e = (throw e);
}