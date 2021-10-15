package lab01;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.ListIterator;
import lab01.CompileException;

public class Parser {
    public static ArrayList<String> output = new ArrayList<String>();
    public static void parseCompUnit(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException{
        parseFuncDef(lexicalIterator,tokenIterator);
    }

    public static void parseFuncDef(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException{
        if (! MyBool.isFuncType(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a FuncType");
        }
        String thisToken = tokenIterator.next();
        output.add("define dso_local i32");
        parseIdent(lexicalIterator, tokenIterator);
        if(!MyBool.isLParen(lexicalIterator.next()) || !MyBool.isRParen(lexicalIterator.next())){
            throw new CompileException("Parser Error is not ()");
        }tokenIterator.next();tokenIterator.next(); //jump ()

        output.add("()");

        parseBlock(lexicalIterator,tokenIterator);
        //TOOD
    }
    public static void parseIdent(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException{
        if (lexicalIterator.hasNext()){
            if (! MyBool.isIdent(lexicalIterator.next())){
                throw new CompileException("Parser Error is not a Ident");
            }
            String thisToken = tokenIterator.next();
            output.add(thisToken);
        }
    }
    public static void parseBlock(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException{
        if(!MyBool.isLBrace(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a { ");
        }tokenIterator.next(); output.add("{");

        parseStmt(lexicalIterator,tokenIterator);

        if(!MyBool.isRBrace(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a } ");
        }tokenIterator.next();output.add("}");
    }
    public static void parseStmt(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException{
        if (!MyBool.isReturn(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a Return ");
        }tokenIterator.next();
        output.add("ret");

        if(!MyBool.isNumber(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a Number ");
        };
        output.add("i32 "+tokenIterator.next());

        if(lexicalIterator.hasNext() && !MyBool.isSemicolon(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a ; ");
        }tokenIterator.next();
        output.add("}");
    }

    public static void main(String[] args) throws FileNotFoundException,CompileException{
        ArrayList<String> words = new ArrayList<String>();
        ArrayList<Integer> lexicalList = new ArrayList<Integer>();
        ArrayList<String> tokenList = new ArrayList<String>();
        try {
            lexicalList = Lexical.getLexicalList(args[0],words);
        }catch (CompileException e){
            System.exit(-1);
        }for (String word : words) {
            tokenList.add(Lexical.typeRecognition(word,lexicalList,false));
        }
        ListIterator<Integer> lexicalIterator = lexicalList.listIterator();
        ListIterator<String> tokenIterator = tokenList.listIterator();
        try {
            parseCompUnit(lexicalIterator,tokenIterator);
        }catch (CompileException e){
            System.out.println(e);
            System.exit(-1);
        }


        for(String str : output){
            System.out.println(str);
        }

//        while(lexicalIterator.hasNext()) {
//            System.out.print(lexicalIterator.next());
//            System.out.println(tokenIterator.next());
//        }

//        for(int i=0;i<lexicalList.size();i++) {
//            System.out.println(tokenList.get(i)+" "+lexicalList.get(i));
//        }
        System.exit(0);
    }
}
