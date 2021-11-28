int exgcd(int a, int b, int x[], int y[]) {
    if (b == 0) {
        x[0] = 1;
        y[0] = 0;
        return a;
    } else {
        int r = exgcd(b, a % b, x, y);
        int t = x[0];
        x[0]  = y[0];
        y[0]  = (t - a / b * y[0]);
        return r;
    }
}