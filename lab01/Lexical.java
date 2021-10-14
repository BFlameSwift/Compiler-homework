package lab01;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;
import Word.Number;
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
        else if (Number.isNumber(str)){
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
                words.add("+inlegal+word"); // 错误
                return true;
            }
            if(isIdentifier(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( ! (line.charAt(j)>='a'&&line.charAt(j)<='z' || line.charAt(j)>='0' && line.charAt(j) <= '9' || line.charAt(j) >= 'A' && line.charAt(j) <= 'Z' || line.charAt(j) == '_'))
                        break;
                }
            }
            else if (SYMBOL_LIST.contains(thisStr) && SYMBOL_LIST.indexOf(thisStr) >= ASSIGN ){
                if(line.charAt(j) == '='){
                    if (j < lineLen-1 && line.charAt(j+1) == '='){
                        j++;
                    }
                }j++;
            }
            else if(Number.isNumber(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( ! (line.charAt(j) >= 48 && line.charAt(j) <= 57))
                        break;
                }
            }
            if (j>i)  {
                words.add(line.substring(i,j));
                i = j-1;
            }
        }return false;
    }

    public static String tokenTran(String str){
        String token;
        int index = SYMBOL_LIST.indexOf(str);
        if( SYMBOL_LIST.contains(str) &&  index<= RETURN_DEC && index >= CONST_DEC) {
//            System.out.println(str);
            token = TOKEN_LIST.get(index);
        }
        else if(SYMBOL_LIST.contains(str) &&  index<= OR && index >= ASSIGN){
            token = TOKEN_LIST.get(index);
        }
        else if (Number.isNumber(str)){return "Number("+ str +")";}
        else if (isIdentifier(str)){return "Ident("+str+")";}
        else {return "Err";}
        return token;
    }

    public static void main(String[] args) throws FileNotFoundException {
//        for (int i=0;i<SYMBOL_LIST.size();i++){
//            System.out.println(i+"   "+SYMBOL_NAMES[i]+"   "+TOKEN_NAMES[i]);
//        }
        String filePath = "./pre/main3.c";
        ArrayList<String> words = new ArrayList<String>();
        Scanner scanner = null;
        scanner = new Scanner(new File(filePath));
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
}


