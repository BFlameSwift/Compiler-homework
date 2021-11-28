int arr[5][5] = {};
int foo(int str[]) {
    str[1] = 1;
    return 2;
}

int main() {
    foo(arr);
    return 0;
}