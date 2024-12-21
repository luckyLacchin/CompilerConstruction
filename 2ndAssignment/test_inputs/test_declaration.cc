struct EXC : exception {
    int error_code;
};

struct Types {
    int i;
    double d;
    bool b;
    exception e;
    EXC exc;
};

void foo(EXC e, exception f, double d, int i, bool b) {
    int i1 = i;
    double d1 = d;
    double d2 = i;
    bool b1 = b;
    exception e1 = e;
    exception e2 = f;
    EXC exc1 = e;

    return;
}

int main() {
    int i0;
    int i1 = 0;
    int i2, i3 = 0;
    int i4, i5;
    int i6 = 0, i7 = 0;

    double d0;
    double d1 = 0.0;
    double d11 = 0;
    double d2, d3 = 0.0;
    double d21, d31 = 0;
    double d4, d5;
    double d6 = 0.0, d7 = 0.0;
    double d61 = 0, d71 = 0;
    double d62 = 0, d72 = 0.0;
    double d63 = 0.0, d73 = 0;

    bool b0;
    bool b1 = true;
    bool b2, b3 = false;
    bool b4, b5;
    bool b6 = true, b7 = false;

    EXC exc0;
    EXC exc1 = exc0;
    EXC exc2, exc3 = exc0;
    EXC exc4, exc5;
    EXC exc6 = exc0, exc7 = exc0;

    exception e0;
    exception e1 = e0;
    exception e2, e3 = exc0;
    exception e4, e5;
    exception e6 = e0, e7 = exc0;
}