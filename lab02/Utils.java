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
//        lexicalIterator = lexicalList.listIterator();
    }
    public static void initIterator(){
        Utils.tokenIterator = Utils.tokenList.listIterator();
        Utils.lexicalIterator = Utils.lexicalList.listIterator();
    }

    private static ArrayList<String> tokenList = new ArrayList<String>();
    private static ArrayList<Integer> lexicalList = new ArrayList<Integer>();
    private static ListIterator<Integer> lexicalIterator ;
    private static ListIterator<String> tokenIterator ;


    public static int getLexical(String expect) throws CompileException{
//        System.out.println("lex next"+lexicalIterator.nextIndex()+"except"+expect);
        if(lexicalIterator.hasNext()){
            return lexicalIterator.next();
        }else{
            throw new CompileException("LexcialList has not next element "+expect);
        }
    }
    public static String getToken(String expect) throws CompileException{
//        System.out.println("token next"+tokenIterator.nextIndex()+"except"+expect);
        if(tokenIterator.hasNext()){
            return tokenIterator.next();
        }else{
            throw new CompileException("TokenList has not next element Expect"+ expect);
        }
    }
    public static String getToken() throws CompileException{
//        System.out.println("token next"+tokenIterator.nextIndex()+"except"+"");
        if(tokenIterator.hasNext()){
            return tokenIterator.next();
        }else{
            throw new CompileException("TokenList has not next element");
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
    public static int getTokenIndex(){
        return tokenIterator.nextIndex();
    }
    public static int getLexicalIndex(){
        return lexicalIterator.nextIndex();
    }
    public static String getTwoListIndex(){
        return Utils.getLexicalIndex() + " "+Utils.getTokenIndex();
    }

}
