package lab02;

import java.io.*;
import java.util.ArrayList;
import java.util.ListIterator;

public class Parser {
    public static ArrayList<String> output = new ArrayList<String>();
    public static void parseCompUnit(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException {
        parseFuncDef(lexicalIterator,tokenIterator);
    }

    public static void parseFuncDef(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException {
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
    public static void parseIdent(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException {
        if (lexicalIterator.hasNext()){
            if (! MyBool.isIdent(lexicalIterator.next())){
                throw new CompileException("Parser Error is not a Ident");
            }
            String thisToken = tokenIterator.next();
            output.add(thisToken);
        }
    }
    public static void parseBlock(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException {
        if(!MyBool.isLBrace(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a { ");
        }tokenIterator.next(); output.add("{");

        parseStmt(lexicalIterator,tokenIterator);

        if(!MyBool.isRBrace(lexicalIterator.next())){
            throw new CompileException("Parser Error is not a } ");
        }tokenIterator.next();
    }
    public static void parseStmt(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException {
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

    public static void deleteComment(ArrayList<Integer> lexicalList, ArrayList<String> tokenList )throws CompileException {
        int listSize = lexicalList.size();
        int[] mark = new int[listSize];
        int i,j;
        for (i=0;i<lexicalList.size();i++){
            if(i<lexicalList.size() && MyBool.isLBlockComment(lexicalList.get(i))){
                while(i<lexicalList.size()-1 && ! MyBool.isRBlockComment(lexicalList.get(i))){
                    lexicalList.remove(i);
                    tokenList.remove(i);
                }
                lexicalList.remove(i);
                tokenList.remove(i);
                i=i-1;
            }
        }
        for (i=0; i<lexicalList.size(); i++) {
            if (lexicalList.get(i)<0)
                throw new CompileException("Lexical Error The String is "+tokenList.get(i));
        }
    }
    public static void outputFile(String file,ArrayList<String> array)  {

        BufferedWriter out = null;
        try {
            out = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(file, true)));
//            out.write(conent+"\r\n");
            for(int i=0;i<output.size();i++){
                out.write(output.get(i)+"\r\n");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }
    public static void main(String[] args) throws FileNotFoundException, CompileException {
        ArrayList<String> words = new ArrayList<String>();
        ArrayList<Integer> lexicalList = new ArrayList<Integer>();
        ArrayList<String> tokenList = new ArrayList<String>();
        try {
            lexicalList = Lexical.getLexicalList(args[0],words);
        }catch (CompileException e){
            System.out.println(e);
            System.exit(-1);
        }for (String word : words) {

            tokenList.add(Lexical.typeRecognition(word,lexicalList,false));
//            System.out.println(word);
        }
        deleteComment(lexicalList,tokenList);
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
//        outputFile(args[1],output );
        System.exit(0);
    }
}
