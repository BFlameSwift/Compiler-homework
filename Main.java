import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;
import java.util.regex.Pattern;
/**
 * @author BFlame
 */
public class Main {

    public static final String INTEGER = "^[-\\+]?[\\d]*$";
    public static final String BLANK = "\\s+";
    public static final String IDENTIFIER = "[a-zA-Z_$][a-zA-Z_0-9$]*";
    public static List<String> reservedWordsBefore = Arrays.asList("if","else","while","break","continue","break","return");
    public static List<String> reservedWordsAfter = Arrays.asList("If","Else","While","Break","Continue","Break","Return");
    public static List<String> signBefore = Arrays.asList("==","=",";","(",")","{","}","+","*","/","<",">");
    public static List<String> signAfter = Arrays.asList("Eq","Assign","Semicolon","LPar","RPar","LBrace","RBrace","Plus","Mult","Div","Lt","Gt");



    public static void main(String[] args) {
        String filePath = args[0];
        ArrayList<String> words = new ArrayList<String>();
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
            hasError = processLine(line,words);
        }
        for (String word : words){
//            System.out.println(word+" "+word.length()+"  "+ tokenTran(word));
            System.out.println(tokenTran(word));
        }

    }
    public static Boolean processLine(String line,ArrayList<String> words){
        line = line.strip();
//        String[] strList = line.split("\\s+");
        int lineLen = line.length(),i,j,k;
        for (i =0;i<lineLen;i++){
            j = i;
            String thisStr = line.substring(i,i+1);
            if(!isLegalWord(thisStr)) {
                Pattern pattern = Pattern.compile(BLANK);
                if(pattern.matcher(thisStr).matches()){
                    continue;
                }
                //TODO System.out.println(thisStr);
                words.add("----");
                return true;

            }

            if(isIdentifier(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( ! (line.charAt(j)>=97&&line.charAt(j)<=122 || line.charAt(j)>=48 && line.charAt(j) <= 57 || line.charAt(j) >= 65 && line.charAt(j) <= 90 || line.charAt(j) == '_'))
                        break;
                }
            }
            else if (isSymbol(thisStr)){

                if(line.charAt(j) == '='){
                    if (line.charAt(j+1) == '='){
                        j++;
                    }
                }
                j++;
            }
            else if(isUnsignNumnber(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( ! (line.charAt(j) >= 48 && line.charAt(j) <= 57))
                        break;
                }
            }

            if (j>i)  {
                words.add(line.substring(i,j));
                i = j-1;
            }

        }
        return false;
    }
    public static String tokenTran(String str){
        String token;

        int index = -1;
        if( isReservedWord(str)) {
//            System.out.println(str);
            index = reservedWordsBefore.indexOf(str);
            token = reservedWordsAfter.get(index);
        }
        else if( isSymbol(str)){
            index = signBefore.indexOf(str);
            token = signAfter.get(index);
        }
        else if (isUnsignNumnber(str)){
            return "Number("+ str +")";
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
        Pattern pattern = Pattern.compile(INTEGER);
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


