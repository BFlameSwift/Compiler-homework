package lab02;

import java.io.*;
import java.util.ArrayList;
import java.util.ListIterator;
//TODO 修改架构： gettoken get lexcial 中间内置抛出异常
public class Parser {
    public static ArrayList<String> output = new ArrayList<String>();
    public static void parseCompUnit()throws CompileException {
        parseFuncDef();
    }

    public static void parseFuncDef()throws CompileException {
//        if (! MyBool.isFuncType(lexicalIterator.next())){
//            throw new CompileException("Parser Error is not a FuncType");
//        }
        Utils.getLexical("Func def int");
        String thisToken = Utils.getToken("FuncDef");
        output.add("define dso_local i32");

        parseIdent();

        if(!MyBool.isLParen(Utils.getLexical("(")) || !MyBool.isRParen(Utils.getLexical(")"))){
            throw new CompileException("Parser Error is not ()");
        }Utils.getToken("(");Utils.getToken(")"); //jump ()

        output.add("()");

        parseBlock();
        //TOOD
    }
    public static void parseIdent()throws CompileException {
        if (! MyBool.isIdent(Utils.getLexical("Ident"))){
            throw new CompileException("Parser Error is not a Ident");
        }
        output.add(Utils.getToken("Ident"));

    }
    public static void parseBlock()throws CompileException {
        if(!MyBool.isLBrace(Utils.getLexical("{"))){
            throw new CompileException("Parser Error is not a { ");
        }Utils.getToken("{"); output.add("{");

        parseStmt();

        if(!MyBool.isRBrace(Utils.getLexical("}"))){
            throw new CompileException("Parser Error is not a } ");
        }Utils.getToken("}"); output.add("}");
  ;
    }
    public static void parseStmt()throws CompileException {
        if (!MyBool.isReturn(Utils.getLexical("return"))){
            throw new CompileException("Parser Error is not a Return ");
        }Utils.getToken("return");
        output.add("ret");

        if(!MyBool.isNumber(Utils.getLexical("number"))){
            throw new CompileException("Parser Error is not a Number ");
        };
        output.add("i32 "+Utils.getToken("number"));
        if(!MyBool.isSemicolon(Utils.getLexical(";"))){
            throw new CompileException("Parser Error is not a ; ");
        }Utils.getToken(";");

        
    }
    public static void parseExp()throws CompileException {
        parseAddExp();
    }
    public static void parseAddExp()throws CompileException {
        parseMulExp();
    }
    public static void parseMulExp()throws CompileException {
        parseUnaryExp();
    }
    public static void parseUnaryExp()throws CompileException {
//    TODO
    }
    public static void parsePrimaryExp() throws CompileException {
        if(true){

        }else{
            throw new CompileException("dont has next Primary");
        }

    }
    // Plus return + Minux return false
    public static Boolean parseUnaryOp(ListIterator<Integer> lexicalIterator,ListIterator<String> tokenIterator )throws CompileException {
    //TODO
        if(lexicalIterator.hasNext()){
            int op = lexicalIterator.next();
            tokenIterator.next();
            if((MyBool.isPlus(op) || MyBool.isMinus(op))){
                throw new CompileException("Unary op is not + or -");
            }
            return MyBool.isPlus(op);
        }
        throw new CompileException("dont has next Option");
    }

    public static void deleteComment()throws CompileException {
        ArrayList<Integer> lexicalList = Utils.getLexicalList();
        ArrayList<String> tokenList = Utils.getTokenList();
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
    public static void lexicalAnalysis(String input) throws CompileException{
        ArrayList<String> words = new ArrayList<String>();
        ArrayList<Integer> lexicalList = Utils.getLexicalList();
        ArrayList<String> tokenList = Utils.getTokenList();

        try {
            lexicalList = Lexical.getLexicalList(input,words);
            Utils.setLexicalList(lexicalList);
        }catch (CompileException e){
            System.out.println(e);
            System.exit(-1);
        }catch (FileNotFoundException e){
            e.printStackTrace();
            System.exit(-1);
        }

        for (String word : words) {
            tokenList.add(Lexical.typeRecognition(word,lexicalList,false));
//            System.out.println(word);
        }Utils.setTokenList(tokenList);
        deleteComment(); // 删除注释
        Utils.initIterator();//修改完成tokenList 与LexcialList后开始初始化迭代器
    }
    public static void main(String[] args) throws  CompileException {
        lexicalAnalysis(args[0]);
        try {
            parseCompUnit();
        }catch (CompileException e){
            System.out.println(e);
//            e.printStackTrace();
            System.exit(-1);
        }
        for(String str : output){
            System.out.println(str);
        }
        outputFile(args[1],output );
        System.exit(0);
    }
}
