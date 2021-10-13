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
    public static List<String> reservedWordsBefore = Arrays.asList("if","else","while","break","continue","break","return");
    public static List<String> reservedWordsAfter = Arrays.asList("If","Else","While","Break","Continue","Break","Return");
    public static List<String> signBefore = Arrays.asList("==","=",";","(",")","{","}","[","]","+","*","/","<",">");
    public static List<String> signAfter = Arrays.asList("Eq","Assign","Semicolon","LPar","RPar","LBrace","RBrace","LSqure","RSqure","Plus","Mult","Div","Lt","Gt");

    public static final int
        CONST_DEC = 1,INT_DEC = 2,VOID_DEC = 3,IF_DEC = 4,ELSE_DEC = 5,WHILE_DEC = 6,CONTINUE_DEC = 7,BREAK_DEC =8, RETURN_DEC = 9,
        ASSIGN = 10,SEMICOLON = 11,LPAREN = 12,RPAREN = 13,LBRACKET = 14,RBRACKET = 15,LBRACE = 16,RBRACE = 17,LT = 18,GT = 19,LE = 20,GE = 21,
        IDENT = 22,DECIMAL_CONST = 23,
        OCTAL_CONST = 24,HEXADECIMAL_CONST = 25,
        PLUS = 26,MINUS = 27,MUL = 28,DIV = 29,MOD = 30, NOT = 31,EQUALS = 32,NEQUALS = 33,COMMA = 34,
        SINGLE_QUOTE = 35,DOUBLE_QUOTE = 36,SINGLE_COMMENT = 37,BLOCK_COMMENT = 38,AND = 39,OR = 40;
    public static final String[] SYMBOL_LIST = {
            null,"const","int","void","if","else","while","continue","break","return",
            "=",";","(",")","[","]","{","}","<",">","<=",">=",
            null,null,null,null,
            "+","-","*","/","%","!","==","!=", "," ,
            "'","\"","\\\\",null,"&&","||"
    };
    public static final String[] TOKEN_NAME = {
            null,"Const","Int","Void" ,"If" ,"Else" ,"While" ,"Continue" ,"Break", "Return",
            "Assign","Semicolon","LParen","RParen","LBracket","RBracket","LBrace","RBrace","Lt","Gt","Le","Ge",
            "Ident","Decimal","Octal","Hexadecimal",
            "Plus" ,"Minus" ,"Mul","Div","Mod", "Not","Equals","NEquals","Comma",
            "SingleQuote" ,"DoubleQuote" ,"SingleComment" ,"BlockComment","And","Or"
    };




    

    public static void main(String[] args) throws FileNotFoundException {
        for (int i=0;i<SYMBOL_LIST.length;i++){
            System.out.println(i+"   "+SYMBOL_LIST[i]+"   "+TOKEN_NAME[i]);
        }
    }
}


