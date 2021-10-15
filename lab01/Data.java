package lab01;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class Data {
    public static void main(String[] args) throws FileNotFoundException {
        String filePath = args[0];
        ArrayList<String> words = new ArrayList<String>();
        Scanner scanner = null;
        scanner = new Scanner(new File(filePath));
        boolean hasError = false;
        while (scanner.hasNextLine()&&!hasError)//逐行读取文件内容
        {
            String line = scanner.nextLine();

        }

    }
}
