import java.util.ArrayList;
import java.util.Scanner;

/**
 * @author BFlame
 */
public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int a=1,b=2;
        if(scanner.hasNext()){
            a = scanner.nextInt();b = scanner.nextInt();
            System.out.println(a+b);
            System.exit(0);
        }

        System.out.println(a+b);
        System.exit(0);
    }

}


