int main() {
    int n = getint();
    int i = 0, sum = 0;
    while (i < n) {
        i = i + 1;
        sum = sum + i;
        putint(sum);
        putch(10);
    }
    return 0;
}