int field[2];
int main() {
    int i[1];
    int j[3];
    int k;
    k = getint();
        field[0] = getint();
    field[1] = getint();

    j[0 + 0] = -1;
    j[1]     = j[0] - 2;
    k        = j[1];
    j[2]     = 16;

    putint(j[3 - field[0]] + 2 + k);

    return 0;
}