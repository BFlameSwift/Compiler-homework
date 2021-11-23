int n;

int main() {
    n = 10;
    int ini_arr[10];
    ini_arr[0] = 4;
    ini_arr[1] = 3;
    ini_arr[2] = 9;
    ini_arr[3] = 2;
    ini_arr[4] = 0;
    ini_arr[5] = 1;
    ini_arr[6] = 6;
    ini_arr[7] = 5;
    ini_arr[8] = 7;
    ini_arr[9] = 8;

    int sorted_arr[10];
    int count_arr[10];
    int i;
    int j;
    int k;
    k = 0;
    i = 0;
    j = 0;
    while (k < 10) {
        count_arr[k] = 0;
        k            = k + 1;
    }
    while (i < n) {
        count_arr[ini_arr[i]] = count_arr[ini_arr[i]] + 1;
        i                     = i + 1;
    }
    k = 1;
    while (k < 10) {
        count_arr[k] = count_arr[k] + count_arr[k - 1];
        k            = k + 1;
    }
    j = n;
    while (j > 0) {
        count_arr[ini_arr[j - 1]]             = count_arr[ini_arr[j - 1]] - 1;
        sorted_arr[count_arr[ini_arr[j - 1]]] = ini_arr[j - 1];
        j                                     = j - 1;
    }
    i = 0;
    while (i < n) {
        int tmp;
        tmp = sorted_arr[i];
        putint(tmp);
        tmp = 10;
        putch(tmp);
        i = i + 1;
    }
    return 0;
}