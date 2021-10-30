package lab03;

import java.util.ArrayList;
import java.util.ListIterator;
import java.util.NoSuchElementException;

public class Token {
    private int lexcial;
    private String value;

    public static Boolean isFuncType(int type){
        return type == Lexical.INT_DEC || type == Lexical.VOID_DEC;
    }

    public static Boolean isIdent(int type){
        return type == Lexical.IDENT;
    }

    public static Boolean isLParen(int type){
        return type == Lexical.LPAREN;
    }

    public static Boolean isRParen(int type){return type == Lexical.RPAREN;}
    public static Boolean isLBrace(int type){return type == Lexical.LBRACE;}
    public static Boolean isRBrace(int type){return type == Lexical.RBRACE;}
    public static Boolean isReturn(int type){return type == Lexical.RETURN_DEC;}
    public static Boolean isNumber(int type){return type == Lexical.DECIMAL_CONST;}
    public static Boolean isSemicolon(int type){return type == Lexical.SEMICOLON;}
    public static Boolean isLBlockComment(int type){return type == Lexical.LBLOCK_COMMENT;}
    public static Boolean isRBlockComment(int type){return type == Lexical.RBLOCK_COMMENT;}
    public static Boolean isPlus(int type){return type == Lexical.PLUS;}
    public static Boolean isMinus(int type){return type == Lexical.MINUS;}
    public static Boolean isUnaryOp(int type){return isPlus(type) || isMinus(type);}
    public static Boolean isMultiply(int type){return type == Lexical.MUL;}
    public static Boolean isDiv(int type){return type == Lexical.DIV;}
    public static Boolean isMod(int type){return type == Lexical.MOD;}
    public static Boolean isLevel3Operator(int type){return isMod(type)|| isMultiply(type) || isDiv(type);}
    public static Boolean isConstDec(int type){return type == Lexical.CONST_DEC;}
    public static Boolean isIntDec(int type){return type == Lexical.INT_DEC;}
    public static Boolean isVoidDec(int type){return type == Lexical.VOID_DEC;}
    public static Boolean isEqual(int type){return type == Lexical.EQUALS;}
    public static Boolean isAssign(int type){return type == Lexical.ASSIGN;}
    public static Boolean isComma(int type){return type == Lexical.COMMA;}
    public static Boolean isDecl(int type){return isIntDec(type) || isConstDec(type);}
    public String getValue() {
        return value;
    }

    private int lineNumber;
    static ArrayList<Token> tokenList = new ArrayList<>();
    static ListIterator<Token> tokenIterator = tokenList.listIterator();

    public static ArrayList<Token> getTokenList() {
        return tokenList;
    }

    public static void setTokenList(ArrayList<Token> tokenList) {
        Token.tokenList = tokenList;
        tokenIterator = tokenList.listIterator();
    }

    public static int nextTokenLexcial(String expect) throws CompileException {
//        System.out.println("token next"+'\t'+getPreviousToken().getValue()+'\t'+"except"+expect);  // Debug 用
        if(tokenIterator.hasNext()){
            return tokenIterator.next().getLexcial();
        }else{
            throw new CompileException("TokenList has not next element Expect"+ expect);
        }
    }

    public static Token nextToken(String expect) throws CompileException {
//        System.out.println("token next"+'\t'+getPreviousToken().getValue()+'\t'+"except"+expect);
        if(tokenIterator.hasNext()){
            return tokenIterator.next();
        }else{
            throw new CompileException("TokenList has not next element "+expect);
        }
    }

    public static Token previousToken() throws CompileException {
//        System.out.println("token previous"+'\t'+getPreviousToken().getValue()+'\t');
        if(tokenIterator.hasPrevious()){
            return tokenIterator.previous();
        }else{
            throw new CompileException("Lexcial no last element!");
        }
    }

    public static int getTokenIndex(){
        return tokenIterator.nextIndex();
    }

    public static Token getPreviousToken() throws CompileException {
        Token previousToken = new Token(-1,"this is first element",1);
        try {
            previousToken = tokenIterator.previous();
        }catch(NoSuchElementException e){
            return previousToken;
        }
        tokenIterator.next();
        return previousToken;
    }

    public static Token getNextToken() throws CompileException {
        Token nextToken = new Token(-1,"this is last element",1);
        try {
            nextToken = tokenIterator.next();
        }catch(NoSuchElementException e){
            return nextToken;
        }finally {
            tokenIterator.previous();
        }
        return nextToken;
    }

    public int getLexcial() {
        return lexcial;
    }



    public int getLineNumber() {
        return lineNumber;
    }



    public Token(int lexcial, String value, int lineNumber) {
        this.lexcial = lexcial;
        this.value = value;
        this.lineNumber = lineNumber;
    }

    public static void exceptNextToken(int lexcial) throws CompileException{
        //期待下一个的Token是什么， 一般用于只检测不处理的情况，例如 分号； 大小括号 逗号等
        String expectString = Lexical.SYMBOL_LIST.get(lexcial);
        if(nextToken(expectString).getLexcial() != lexcial){
            throw new CompileException("Parse Error next is not a "+ expectString);
        }
    }
    public static Boolean judgeNextToken(int lexcial) throws CompileException {
        String expectString = Lexical.SYMBOL_LIST.get(lexcial);
        return (nextToken(expectString).getLexcial()) == lexcial;
    }

    public Boolean judgeThis(int lexcial){
        return this.lexcial == lexcial;
    }

}
