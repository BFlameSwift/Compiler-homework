int main() {
     int a = 1, sum;
     if (a == 1) {
         sum = 0;
         a = a + 1;
         sum = sum + a;
         if (a == 2) {
             a = a + 2;
             sum = sum - a;
             if (a == 4) {
                 a = a + 4;
                 sum = sum + a;
                 if (a != 8) {
                     a = a + 8;
                     sum = sum - a;
                     if (a == 16) {
                         a = a + 16;
                         sum = sum + a;
                     }
                 }
             }
         }
     }
     putint(a);
     putint(sum);
     return 0;
 }