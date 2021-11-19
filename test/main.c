int main() {
    int instruction, low, high, mid, count;
    count = getint();
    while (count > 0) {
        low   = getint();
        high  = getint();
        count = count - 1;
        while (1) {
            mid         = (low + high + 1) / 2;
            instruction = getint();
            if (instruction == 0) {
                break;
            } else if (instruction == 1) {
                high = mid;
            } else if (instruction == 2) {
                low = mid;
            } else {
                putch(69);
                putch(10);
                continue;
            }

            if (low == high) {
                putch(67);
                putch(10);
                break;
            }
            putint(mid);
            putch(10);
        }
        putint(mid);
        putch(10);
        putch(10);
    }
    return 0;
}