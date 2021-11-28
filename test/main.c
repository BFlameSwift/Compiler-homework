void set1(int pos, int arr[]) {
    arr[pos] = 1;
}

int main() {
    int a[2][5];
    int n;
    n = getarray(a[0]);
    getarray(a[1]);
    int i = 0;
    while (i < n) {
        set1(i, a[i % 2]);
        i = i + 1;
    }
    putarray(n, a[0]);
    putarray(n, a[1]);
    return 0;
}