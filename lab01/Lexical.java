package lab01;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;
import java.util.regex.Pattern;

/**
 * @author BFlame
 */
public class Lexical {
    public static final String INTEGER = "^[\\d]*$";
    public static final String BLANK = "\\s+";
    public static final String IDENTIFIER = "[a-zA-Z_$][a-zA-Z_0-9$]*";



    public static final int
        CONST_DEC = 1,INT_DEC = 2,VOID_DEC = 3,IF_DEC = 4,ELSE_DEC = 5,WHILE_DEC = 6,CONTINUE_DEC = 7,BREAK_DEC =8, RETURN_DEC = 9,
        ASSIGN = 10,SEMICOLON = 11,LPAREN = 12,RPAREN = 13,LBRACKET = 14,RBRACKET = 15,LBRACE = 16,RBRACE = 17,LT = 18,GT = 19,LE = 20,GE = 21,
        IDENT = 22,DECIMAL_CONST = 23,
        OCTAL_CONST = 24,HEXADECIMAL_CONST = 25,
        PLUS = 26,MINUS = 27,MUL = 28,DIV = 29,MOD = 30, NOT = 31,EQUALS = 32,NEQUALS = 33,COMMA = 34,
        SINGLE_QUOTE = 35,DOUBLE_QUOTE = 36,SINGLE_COMMENT = 37,BLOCK_COMMENT = 38,AND = 39,OR = 40;
    public static final String[] SYMBOL_NAMES = {
            null,"const","int","void","if","else","while","continue","break","return",
            "=",";","(",")","[","]","{","}","<",">","<=",">=",
            null,null,null,null,
            "+","-","*","/","%","!","==","!=", "," ,
            "'","\"","\\\\",null,"&&","||"
    };
    public static final String[] TOKEN_NAMES = {
            null,"Const","Int","Void" ,"If" ,"Else" ,"While" ,"Continue" ,"Break", "Return",
            "Assign","Semicolon","LParen","RParen","LBracket","RBracket","LBrace","RBrace","Lt","Gt","Le","Ge",
            "Ident","Decimal","Octal","Hexadecimal",
            "Plus" ,"Minus" ,"Mul","Div","Mod", "Not","Equals","NEquals","Comma",
            "SingleQuote" ,"DoubleQuote" ,"SingleComment" ,"BlockComment","And","Or"
    };
    public static List<String> TOKEN_LIST = Arrays.asList(TOKEN_NAMES);
    public static List<String> SYMBOL_LIST = Arrays.asList(SYMBOL_NAMES);
    public static Boolean isLegalWord(String str){
        if (SYMBOL_LIST.contains(str)){
            return true;
        }else if(isIdentifier(str)){
            return true;
        }
        else if (MyNumber.isNumber(str)){
            return true;
        }
        return false;
    }
    public static boolean isIdentifier(String str){
        Pattern pattern = Pattern.compile(IDENTIFIER);
        return pattern.matcher(str).matches();
    }
    public static Boolean processLine(String line,ArrayList<String> words){
        // TODO 处理注释，长度不为 1的串
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
                }// 跳过空白
                //TODO System.out.println(thisStr);
                System.out.println("无效word："+thisStr);
                words.add("+inlegal+word"); // 错误
                return true;
            }
            if(isIdentifier(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( ! (line.charAt(j)>='a'&&line.charAt(j)<='z' || line.charAt(j)>='0' && line.charAt(j) <= '9' || line.charAt(j) >= 'A' && line.charAt(j) <= 'Z' || line.charAt(j) == '_')) {
                        break;
                    }
                }
            }
            else if (SYMBOL_LIST.contains(thisStr) && SYMBOL_LIST.indexOf(thisStr) >= ASSIGN ){
                if(line.charAt(j) == '='){
                    if (j < lineLen-1 && line.charAt(j+1) == '='){
                        j++;
                    }
                }j++;
            }
            else if(MyNumber.isNumber(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( (line.charAt(j) >= 48 && line.charAt(j) <= 57)) {
                        continue;
                    } else if( (j==i+1)&&line.charAt(i)=='0'&&(line.charAt(j)=='x'||line.charAt(j)== 'X')) {
                        continue;
                    } else {
                        break;
                    }
                }
            }
            if (j>i)  {
                words.add(line.substring(i,j));
                i = j-1;
            }
        }return false;
    }

    public static String typeRecognition(String str, ArrayList<Integer> lexicalList,Boolean isAdd) {
        String token;
        int index = SYMBOL_LIST.indexOf(str);
        if( SYMBOL_LIST.contains(str) &&  index<= RETURN_DEC && index >= CONST_DEC) {
//            System.out.println(str);
            token = TOKEN_LIST.get(index);
            lexicalList.add(Integer.valueOf(index));
        }
        else if(SYMBOL_LIST.contains(str) &&  index<= OR && index >= ASSIGN){
            token = TOKEN_LIST.get(index);
            lexicalList.add(Integer.valueOf(index));
//            tokenList.add(SYMBOL_LIST.get(index));
        }
        else if (MyNumber.isNumber(str)){
            lexicalList.add(Integer.valueOf(DECIMAL_CONST));
//            tokenList.add(String.valueOf(MyNumber.toInteger(str)));
//            tokens.put(DECIMAL_CONST,String.valueOf(MyNumber.toInteger(str)));
            token = "Number("+ String.valueOf(MyNumber.toInteger(str)) +")";

        }
        else if (isIdentifier(str)){
            lexicalList.add(Integer.valueOf(IDENT));
            token  = "@"+str;
        }
        else {
            lexicalList.add(Integer.valueOf(-1));
            token = "Err";
        }
        if(isAdd == false) {
            lexicalList.remove(lexicalList.size()-1);
        }
        return token;
    }
    public static ArrayList<Integer> getLexicalList(String filePath,ArrayList<String> words)  throws FileNotFoundException{
//        String filePath = "./pre/main3.c";
        ArrayList<Integer> lexicalList = new ArrayList<Integer>();
        Scanner scanner = null;
        scanner = new Scanner(new File(filePath));
        boolean hasError = false;
        while (scanner.hasNextLine()&&!hasError){//逐行读取文件内容
            String line = scanner.nextLine();
            hasError = processLine(line,words);
        }
        for (String word : words){
            typeRecognition(word,lexicalList,true);
//            System.out.println(word+" "+"  "+ tokenTran(word,lexicalList));
        }
        return lexicalList;
    }
    public static void main(String[] args) throws FileNotFoundException {
        ArrayList<String> words = new ArrayList<String>();
        ArrayList<Integer> lexicalList = getLexicalList("./lab01/main3.c",words);
        ArrayList<String> tokenList = new ArrayList<String>();
        for (String word : words) {
            tokenList.add(typeRecognition(word,lexicalList,false));
        }
        for(int i=0;i<lexicalList.size();i++) {
            System.out.println(tokenList.get(i)+" "+lexicalList.get(i));
        }

    }
}

