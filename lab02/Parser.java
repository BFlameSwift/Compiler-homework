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
    }

    public static void parseStmt()throws CompileException {
        if (!MyBool.isReturn(Utils.getLexical("return"))){
            throw new CompileException("Parser Error is not a Return ");
        }Utils.getToken("return");
        output.add("ret");

        int expNum = parseExp();
//        if(!MyBool.isNumber(Utils.getLexical("number"))){
//            throw new CompileException("Parser Error is not a Number ");
//        };
        output.add("i32 "+expNum);
        if(!MyBool.isSemicolon(Utils.getLexical(";"))){
            throw new CompileException("Parser Error is not a ; ");
        }Utils.getToken(";");


    }
    public static int parseExp()throws CompileException {
//        System.out.println("get Exp");
        return parseAddExp();
    }
    public static int parseAddExp()throws CompileException {
        int mulExpNum = parseMulExp();

        while(MyBool.isUnaryOp(Utils.getLexical("+ or -"))){
            String op = Utils.getToken("+ or -");
            System.out.println("this op:"+op);
            if(op.equals("Plus")) {
                mulExpNum += parseMulExp();
            }else if (op.equals("Minus")) {
                mulExpNum -= parseMulExp();
            }else{
                throw new IllegalArgumentException("not - +");
            }
        }Utils.backLexcial();
        return mulExpNum;
    }
    public static int parseMulExp()throws CompileException {
//        System.out.println("get UnaryExp");
        int unaryExpNum = parseUnaryExp();
        while(MyBool.isLevel3Operator(Utils.getLexical("* / %"))){
            String op = Utils.getToken("* / %");
            if(op.equals("Mul")) {
                unaryExpNum *= parseUnaryExp();
            }else if(op.equals("Div")) {
                unaryExpNum /= parseUnaryExp();
            }else if(op.equals("Mod")){
                unaryExpNum %= parseUnaryExp();
            }else{
                throw new IllegalArgumentException("not * / %");
            }
        }
        Utils.backLexcial();
        return unaryExpNum;
    }
    public static int parseUnaryExp()throws CompileException {

        int thisLexcial = Utils.getLexical("( or Op");
        Utils.getToken();
        if(MyBool.isUnaryOp(thisLexcial)){
            int coefficient = 1;
            while(MyBool.isUnaryOp(thisLexcial)){
                coefficient *= parseUnaryOp(thisLexcial);
                thisLexcial = Utils.getLexical("UnaryOp");
                Utils.getToken();
            }Utils.backLexcial(); Utils.backToken();

            return coefficient * parsePrimaryExp();
        }else{
            Utils.backLexcial(); Utils.backToken();
            return parsePrimaryExp();
        }
    }

    public static int parsePrimaryExp() throws CompileException {
        int morpheme = Utils.getLexical("( or Number in PrimaryExp");
        String token = Utils.getToken();
        

        if( MyBool.isLParen(morpheme)){

            int num = parseExp();

            if(!MyBool.isRParen(Utils.getLexical(")"))){
                throw new CompileException("Parser Error is not )");
            }Utils.getToken();
            return num;

        }else if(MyBool.isNumber(morpheme)){
            return Integer.parseInt(token);
        }
        else{
//            System.out.println(morpheme+token);
            throw new CompileException("Parser Error is not ( or Number in PrimaryExp");
        }

    }
    // Plus return + Minux return false
    public static int parseUnaryOp(int morpheme)throws CompileException {
        int op = morpheme;

        if(!(MyBool.isPlus(op) || MyBool.isMinus(op))){
            throw new CompileException("Unary op is not + or -");
        }
        return MyBool.isPlus(op)?1:-1;
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
//            System.out.println(e);
            e.printStackTrace();
            System.out.println(Utils.getLexicalList().size()+" "+Utils.getTokenList().size());
            System.exit(-1);
        }
        for(String str : output){
            System.out.println(str);
        }
        outputFile(args[1],output );
        System.exit(0);
    }
}
