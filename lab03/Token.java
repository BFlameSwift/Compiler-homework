package lab03;

import java.util.ArrayList;
import java.util.ListIterator;
import java.util.NoSuchElementException;

public class Token {

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

    public static Token getNowToken() throws CompileException {
        Token previousToken = new Token(-1,"this is first element",1);
        try {
            previousToken = tokenIterator.previous();
        }catch(NoSuchElementException e){
            return previousToken;
        }
        return tokenIterator.next();
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

    private int lexcial;
    private String value;

    public String getValue() {
        return value;
    }

    private int lineNumber;

    public Token(int lexcial, String value, int lineNumber) {
        this.lexcial = lexcial;
        this.value = value;
        this.lineNumber = lineNumber;
    }

}
