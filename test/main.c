int main() {
    int a = 1, sum = 0;
    {
        int a = 2;
        sum   = sum + a;
        {
            int a = 3;
            sum   = sum + a;
            putint(sum);
            putint(a);
            putch(10);
            {
                a        = 4;
                int sum1 = sum;
                int sum  = sum1 + a;
                {
                    int a    = 5;
                    int sum1 = sum;
                    int sum  = sum1 + a;
                    a        = 6;
                    putint(sum);
                    putint(a);
                    putch(10);
                    sum = sum + a;
                    {
                        a   = 7;
                        sum = sum + a;
                        putint(sum);
                        putint(a);
                        sum = sum + a;
                        putch(10);
                    }
                }
            }
        }
        putint(sum);
        putint(a);
    }
    return 0;
}