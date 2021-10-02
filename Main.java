import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;
import java.util.regex.Pattern;
/**
 * @author BFlame
 */
public class Main {

    public static final String UNSIGN_NUMNBER = "^\\d+$";
    public static final String IDENTIFIER = "[a-zA-Z_$][a-zA-Z_0-9$]*";
    public static List<String> reservedWordsBefore = Arrays.asList("if","else","while","break","continue","break","return");
    public static List<String> reservedWordsAfter = Arrays.asList("If","Else","While","Break","Continue","Break","Return");
    public static List<String> signBefore = Arrays.asList("==","=",";","(",")","{","}","+","*","/","<",">");
    public static List<String> signAfter = Arrays.asList("Eq","Assign","Semicolon","LPar","RPar","LBrace","RBrace","Plus","Mult","Div","Lt","Gt");

    public static void main(String[] args) {
        String filePath = args[0];
        Scanner scanner = null;
        try {
            scanner = new Scanner(new File(filePath));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        boolean hasError = false;
        while (scanner.hasNextLine()&&!hasError)//逐行读取文件内容
        {
            String line = scanner.nextLine();
            hasError = processLine(line);
        }

    }
    public static Boolean processLine(String line){
        String[] strList = line.split("\\s+");
        for (String str :strList){
//            System.out.println(str);
            String token = tokenTran(str);
//            System.out.println(token);
            if(token.equals("Err")){
                int strLen = str.length();
                for(int i = strLen - 1;i > 0;i --){
                    String frontStr = str.substring(0,i),backStr =str.substring(i,strLen);
                    if(isLegalWord(frontStr) && isLegalWord(backStr)){
                        String token1 = tokenTran(frontStr),token2 = tokenTran(backStr);
                        token = token1+"\n"+token2;
                        break;
                    }
                    return true;
                }

            }
            System.out.println(token);
        }
        return false;
    }
    public static String tokenTran(String str){
        String token;

        int index = -1;
        if( isReservedWord(str)) {
            System.out.println(str);
            index = reservedWordsBefore.indexOf(str);
            token = reservedWordsAfter.get(index);
        }
        else if( isSymbol(str)){
            index = signBefore.indexOf(str);
            token = signAfter.get(index);
        }
        else if (isUnsignNumnber(str)){
            return "Number("+ Integer.parseInt(str) +")";
        }
        else if (isIdentifier(str)){
            return "Ident("+str+")";
        }
        else {
            return "Err";
        }
        return token;
    }


    public static boolean isUnsignNumnber(String str) {
        Pattern pattern = Pattern.compile(UNSIGN_NUMNBER);
        return pattern.matcher(str).matches();
    }
    public static boolean isIdentifier(String str){
        Pattern pattern = Pattern.compile(IDENTIFIER);
        return pattern.matcher(str).matches();
    }
    public static boolean isReservedWord(String str){
        return reservedWordsBefore.contains(str);
    }
    public static boolean isSymbol(String str){
        return signBefore.contains(str);
    }
    public static boolean isLegalWord(String str){
        return isReservedWord(str) || isIdentifier(str) || isSymbol(str) || isUnsignNumnber(str);
    }
}


