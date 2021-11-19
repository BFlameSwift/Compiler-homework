const int ascii_0 = 48;

int main() {
    int sum = 0, c;

    while (1) {
        c = getch() - ascii_0;
        if (c < 0 || c > 9) {
            continue;
        } else {
            break;
        }
    }
    sum = c;

    while (1) {
        c = getch() - ascii_0;
        if (c >= 0 && c <= 9) {
            sum = sum * 10 + c;
        } else {
            break;
        }
    }

    putint(sum);
    putch(10);

    sum = 0;

    while (1) {
        c = getch() - ascii_0;
        if (c < 0 || c > 9) {
            continue;
        } else {
            break;
        }
    }
    sum = c;

    while (1) {
        c = getch() - ascii_0;
        if (c >= 0 && c <= 9) {
            sum = sum * 10 + c;
        } else {
            break;
        }
    }

    putint(sum);
    return 0;
}