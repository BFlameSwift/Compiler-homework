int gcd(int m, int n) {
    if (n == 0) {
        return m;
    }
    return gcd(n, m % n);
}

int main() {
    int a = 100, b = 48;
    putint(gcd(a, b));
    return 0;
}