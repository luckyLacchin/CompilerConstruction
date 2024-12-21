struct Apple {
    int color;
};

struct EXC : exception
{
    Apple apple;
    int error_code;
    double p;
};

exception func_ex(EXC e, exception f, double d, int i, bool b) {
    return f;
}


int main() {
    int i = 0;
    double j = 0;

    EXC exc;

    exc.apple.color++;
    exc.apple.color--;
    ++exc.apple.color;
    --exc.apple.color;
    +exc.apple.color;
    -exc.apple.color;

    exc.error_code++;
    exc.error_code--;
    +exc.error_code;
    -exc.error_code;

    exc.p++;
    exc.p--;
    ++exc.p;
    --exc.p;
    +exc.p;
    -exc.p;

    i++;
    i--;
    ++i;
    --i;
    +i;
    -i;

    j++;
    j--;
    ++j;
    --j;
    +j;
    -j;
}