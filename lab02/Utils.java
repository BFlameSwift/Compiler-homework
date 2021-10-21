package lab02;
import lab02.CompileException.*;
import java.util.ArrayList;
import java.util.ListIterator;

public class Utils {
    public static ArrayList<String> getTokenList() {return tokenList;}
    public static ArrayList<Integer> getLexicalList() {return lexicalList;}
    public static void setTokenList(ArrayList<String> tokenList) {
        Utils.tokenList = tokenList;
    }

    public static void setLexicalList(ArrayList<Integer> lexicalList) {
        Utils.lexicalList = lexicalList;
    }

    private static ArrayList<String> tokenList = new ArrayList<String>();
    private static ArrayList<Integer> lexicalList = new ArrayList<Integer>();
    public static ListIterator<Integer> lexicalIterator = lexicalList.listIterator();
    public static ListIterator<String> tokenIterator = tokenList.listIterator();


    public static int getLexical(String expect) throws CompileException{
        if(lexicalIterator.hasNext()){
            return lexicalIterator.next();
        }else{
            throw new CompileException("LexcialList has not next element "+expect);
        }
    }
    public static String getToken(String expect) throws CompileException{
        if(tokenIterator.hasNext()){
            return tokenIterator.next();
        }else{
            throw new CompileException("TokenList has not next element Expect"+ expect);
        }

    }
    public static void backLexcial() throws CompileException{
        if(lexicalIterator.hasPrevious()){
            lexicalIterator.previous();
        }else{
            throw new CompileException("Lexcial no last element!");
        }
    }
    public static void backToken() throws CompileException{
        if(tokenIterator.hasPrevious()){
            tokenIterator.previous();
        }else{
            throw new CompileException("Token no last element!");
        }
    }


}
