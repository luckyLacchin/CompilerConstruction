struct EXC : exception {
    int error_code;
};

int fun0() {}

double fun1() {}

bool fun2() {}

exception fun3() {}

EXC fun4() {}

void fun5() {}

int fun6(int i, double d, bool b, exception e, EXC ex) {}

void main () {
    int i = fun0();
    double d = fun1();
    double d1 = fun0();
    bool b = fun2();
    exception e = fun3();
    exception e1 = fun4();
    EXC exc = fun4();
    fun5();
    
    fun6(i, d, b, e, exc);
    fun6(fun6(1, 1, fun2(), e, exc), 1, true, exc, fun4());
    fun6(1, 1, true, exc, fun4());

    return fun5();
}
