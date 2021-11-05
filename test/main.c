int main() {
    int flag = getint();
    int a, b;
    if (flag == 0) {
        a = 1;
        b = 2;
    } else if (flag == 1) {
        b = 1;
        a = 2;
    }
    putint(a * 10 + b);
    return 0;
}