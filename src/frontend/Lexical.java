package frontend;

import Util.CompileException;
import Util.MyConst;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
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
        SINGLE_QUOTE = 35,DOUBLE_QUOTE = 36,SINGLE_COMMENT = 37,LBLOCK_COMMENT = 38,RBLOCK_COMMENT = 39,AND = 40,OR = 41;
    public static final String[] SYMBOL_NAMES = {
            null,"const","int","void","if","else","while","continue","break","return",
            "=",";","(",")","[","]","{","}","<",">","<=",">=",
            null,null,null,null,
            "+","-","*","/","%","!","==","!=", "," ,
            "'","\"","\\\\","/*","*/","&&","||"
    };
    public static final String[] TOKEN_NAMES = {
            null,"Const","Int","Void" ,"If" ,"Else" ,"While" ,"Continue" ,"Break", "Return",
            "Assign","Semicolon","LParen","RParen","LBracket","RBracket","LBrace","RBrace","slt","sgt","sle","sge",
            "Ident","Decimal","Octal","Hexadecimal",
            "add" ,"sub" ,"mul","sdiv","srem", "Not","eq","ne","Comma",
            "SingleQuote" ,"DoubleQuote" ,"SingleComment" ,"LBlockComment","RBlockComment","and","or"
    }; // srem == Mod
    public static List<String> TOKEN_LIST = Arrays.asList(TOKEN_NAMES);
    public static List<String> SYMBOL_LIST = Arrays.asList(SYMBOL_NAMES);
    public static Boolean isLegalWord(String str){
        if (SYMBOL_LIST.contains(str)){
            return true;
        }else if(isIdentifier(str)){
            return true;
        }
        else if (MyConst.isNumber(str)){
            return true;
        }
        else if (str.startsWith("&") || str.startsWith("|")){
            return true;
        }// 设计不佳。。导致这两个特殊字符要单独处理。。
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
//                System.out.println("无效word："+thisStr);
                words.add("非法字符"); //  必定非法的字符

//                return false;
            }
            if(isIdentifier(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( ! (line.charAt(j)>='a'&&line.charAt(j)<='z' || line.charAt(j)>='0' && line.charAt(j) <= '9' || line.charAt(j) >= 'A' && line.charAt(j) <= 'Z' || line.charAt(j) == '_')) {
                        break;
                    }
                }
            }
            else if (SYMBOL_LIST.contains(thisStr) && SYMBOL_LIST.indexOf(thisStr) >= ASSIGN ){
                if(line.charAt(j) == '=' || line.charAt(j) == '!'|| line.charAt(j) == '<'|| line.charAt(j) == '>'){
                    if (j < lineLen-1 && line.charAt(j+1) == '='){
                        j++; // == != <= >=
                    }
                }else if(line.charAt(j) == '/'){
                    if (j < lineLen-1 && line.charAt(j+1) == '/'){
                        // 关于单行注释
                        return false;
                    }
                    else if (j < lineLen-1 && line.charAt(j+1) == '*'){
                        j++;
                    }
                }else if(line.charAt(j) == '*'){
                    if (j < lineLen-1 && line.charAt(j+1) == '/'){
                        j++; // 多行注释
                    }
                }else if(line.charAt(j) == '<' &&j < lineLen-1 && line.charAt(j+1) == '='){
                    j++;//<=
                }else if(line.charAt(j) == '>' &&j < lineLen-1 && line.charAt(j+1) == '='){
                    j++;//>=
                }else if(line.charAt(j) == '!' &&j < lineLen-1 && line.charAt(j+1) == '='){
                    j++; // !=
                }
                j++;
            }
            else if(MyConst.isNumber(thisStr)){
                for(j = i+1;j<lineLen;j++){
                    if( (line.charAt(j) >= 48 && line.charAt(j) <= 57)) {
                        continue;
                    } else if( (j==i+1)&&line.charAt(i)=='0'&&(line.charAt(j)=='x'||line.charAt(j)== 'X')) {
                        for (k=j+2;k<lineLen;k++){
                            if(!((line.charAt(k)>='0'&&line.charAt(k)<='9') ||(line.charAt(k)>='a'&&line.charAt(k)<='f') ||(line.charAt(k)>='A'&&line.charAt(k)<='F'))) {
                                break;
                            }
                        }
                        j=k-1;
                    } else {
                        break;
                    }
                }
            }else if(line.charAt(j) == '&' || line.charAt(j)=='|'){
                if (j < lineLen-1 && line.charAt(j+1) == line.charAt(j)){
                    j++; // && || 的录入
                }j++;
            }
            if (j>i)  {
                words.add(line.substring(i,j));
                i = j-1;
            }
        }return false;
    }

    public static String typeRecognition(String str, ArrayList<Integer> lexicalList,Boolean isAdd) throws CompileException {
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
        else if (MyConst.isNumber(str)){
            lexicalList.add(Integer.valueOf(DECIMAL_CONST));
//            tokenList.add(String.valueOf(MyConst.toInteger(str)));
//            tokens.put(DECIMAL_CONST,String.valueOf(MyConst.toInteger(str)));
            token =  String.valueOf(MyConst.toInteger(str)) ;

        }
        else if (isIdentifier(str)){
            lexicalList.add(Integer.valueOf(IDENT));
            token  = "@"+str;
            // TODO 去掉@
        }
        else {
            lexicalList.add(Integer.valueOf(-1));

            token = str;

//            throw new CompileException("Lexical Error The String is "+str);
        }
        if(isAdd == false) {
            lexicalList.remove(lexicalList.size()-1);
        }
        return token;
    }
    public static ArrayList<Integer> getLexicalList(String filePath,ArrayList<String> words)  throws FileNotFoundException , CompileException {
//        String filePath = "./pre/main.c";
        ArrayList<Integer> lexicalList = new ArrayList<Integer>();
        Scanner scanner = null;
        scanner = new Scanner(new File(filePath));
        boolean hasError = false;
        while (scanner.hasNextLine()&&!hasError){//逐行读取文件内容
            String line = scanner.nextLine();
//            System.out.println(line);
            hasError = processLine(line,words);
        }
        for (String word : words){
            typeRecognition(word,lexicalList,true);
//            System.out.println(word+" "+"  "+ tokenTran(word,lexicalList));
        }
        scanner.close();
        return lexicalList;
    }
    public static ArrayList<frontend.Token> makeTokenList(String filePath)throws FileNotFoundException , CompileException {
        ArrayList<frontend.Token> tokens = new ArrayList<frontend.Token>();
        ArrayList<String> words = new ArrayList<String>();
        ArrayList<Integer> lexicalList = new ArrayList<Integer>();
        try {
            lexicalList = getLexicalList(filePath,words);
        }catch (CompileException e){
            System.out.println(e);
            System.exit(-1);
        }
        ArrayList<String> tokenList = new ArrayList<String>();

        for (String word : words) {
            tokenList.add(typeRecognition(word,lexicalList,false));
        }
        int listSize = lexicalList.size();
        for(int i = 0; i < listSize; ++i){
            tokens.add(new frontend.Token(lexicalList.get(i),tokenList.get(i),0));
        }
        frontend.Parser.deleteComment(tokens);
        frontend.Token.setTokenList(tokens);
        return tokens;
    }

    public static void main(String[] args) throws FileNotFoundException , CompileException {
//        System.out.println(isLegalWord("~"));
        ArrayList<frontend.Token> tokens = makeTokenList(args[0]);
        int while_num = 0;
        for(frontend.Token token :tokens){
            if(token.getLexcial() ==WHILE_DEC){while_num++;

            }
            System.out.println(token.getValue()+"  "+token.getLexcial());
        }
        System.out.println(while_num);
    }

}


