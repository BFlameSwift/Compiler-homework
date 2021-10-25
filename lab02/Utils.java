package lab02;
import lab02.CompileException.*;
import java.util.ArrayList;
import java.util.ListIterator;

public class Utils {

    public static ArrayList<Token> getTokenList() {
        return tokenList;
    }
    public static void setTokenList(ArrayList<Token> tokenList) {
        Utils.tokenList = tokenList;
        Utils.tokenIterator = tokenList.listIterator();
    }
    private static ArrayList<Token> tokenList = new ArrayList<>();

    private static ListIterator<Token> tokenIterator = tokenList.listIterator();


    public static int nextTokenLexcial(String expect) throws CompileException{
//        System.out.println("token next"+tokenIterator.nextIndex()+"except"+expect);  // Debug 用
        if(tokenIterator.hasNext()){
            return tokenIterator.next().getLexcial();
        }else{
            throw new CompileException("TokenList has not next element Expect"+ expect);
        }
    }

    public static Token nextToken(String expect) throws CompileException{
        //        System.out.println("lex next"+lexicalIterator.nextIndex()+"except"+expect);
        if(tokenIterator.hasNext()){
            return tokenIterator.next();
        }else{
            throw new CompileException("TokenList has not next element "+expect);
        }
    }
    public static void previousToken() throws CompileException{
        if(tokenIterator.hasPrevious()){
            tokenIterator.previous();
        }else{
            throw new CompileException("Lexcial no last element!");
        }
    }

    public static int getTokenIndex(){
        return tokenIterator.nextIndex();
    }
    public static Token getPreviousToken() throws CompileException{
        Token previousToken = tokenIterator.previous();
        tokenIterator.next();
        return previousToken;

    }

}
