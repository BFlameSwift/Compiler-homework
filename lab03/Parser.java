package lab03;

import java.io.*;
import java.util.ArrayList;

//TODO 修改架构： gettoken get lexcial 中间内置抛出异常
public class Parser {
    public static ArrayList<String> output = new ArrayList<String>();
    public static void parseCompUnit()throws CompileException {
        parseFuncDef();
    }
    public static void parseDecl() throws CompileException {
        if(MyBool.isConstDec(Utils.nextTokenLexcial("const"))){
            Utils.previousToken();
            parseConstDecl();
        }else{
            Utils.previousToken();
            //TODO vardecl
        }
    }
    public static void parseConstDecl() throws CompileException {
        if(!MyBool.isConstDec(Utils.nextTokenLexcial("const"))){
            throw new CompileException("Parser constdecl Error is not const");
        }
        parseBType();
        parseConstDef();
        while(!MyBool.isComma(Utils.nextTokenLexcial(","))){
            parseConstDef();
        }Utils.previousToken();
        while(!MyBool.isSemicolon(Utils.nextTokenLexcial(";"))){
            throw new CompileException("Parser constdecl Error is not ;");
        }
    }
    public static void parseBType() throws CompileException { // 检测Bype 只有int
        if(!MyBool.isIntDec(Utils.nextTokenLexcial("int"))){
            throw new CompileException("Parser Error is not int");
        }
    }
    public static void parseConstDef() throws CompileException {
        //TODO 添加进符号表
        Token identToken = Utils.nextToken("ident");
        if(!MyBool.isIdent(identToken.getLexcial())){
            throw new CompileException("Parser const def Error is not Ident");
        }if(!MyBool.isEqual(Utils.nextTokenLexcial("="))){
            throw new CompileException("Parser const def Error is not =");
        }
        int valueConstInitval = parseConstExp();
    }

    public static int parseConstExp() throws CompileException {
        return parseAddExp();
    }
    public static void parseVarDecl() throws CompileException {
        parseBType();
        parseVarDef();
    }
    public static void parseVarDef() throws CompileException {
        Token identToken = Utils.nextToken("ident");
//        output.add("allocte "+identToken.getValue());
        if(MyBool.isEqual(Utils.nextTokenLexcial("="))){
            parseInitVal();
            // TODO 变量赋值
        }Utils.previousToken();
        return;
    }
    public static void parseInitVal() throws CompileException {
        parseExp();
        // TODO 修改EXP
    }


    public static void parseFuncDef()throws CompileException {
//        if (! MyBool.isFuncType(lexicalIterator.next())){
//            throw new CompileException("Parser Error is not a FuncType");
//        }
        Utils.nextToken("FuncDef");
        output.add("define dso_local i32");

        parseIdent();

        if(!MyBool.isLParen(Utils.nextToken("(").getLexcial()) || !MyBool.isRParen(Utils.nextToken(")").getLexcial())){
            throw new CompileException("Parser Error is not ()");
        }
        output.add("()");

        parseBlock();
        //TOOD
    }
    public static void parseIdent()throws CompileException {

        if (! MyBool.isIdent(Utils.nextToken("Ident").getLexcial())){
            throw new CompileException("Parser Error is not a Ident");
        }
        output.add(Utils.getPreviousToken().getValue());

    }
    public static void parseBlock()throws CompileException {
        if(!MyBool.isLBrace(Utils.nextTokenLexcial("{"))){
            throw new CompileException("Parser Error is not a { ");
        } output.add("{");

        while (!MyBool.isRBrace(Utils.nextTokenLexcial("}"))) {
            Utils.previousToken();
            parseBlockItem();
        }Utils.previousToken();
//        parseStmt();

        if(!MyBool.isRBrace(Utils.nextTokenLexcial("}"))){
            throw new CompileException("Parser Error is not a } ");
        } output.add("}");
    }
    public static void parseBlockItem() throws CompileException {
        if(MyBool.isDecl(Utils.nextTokenLexcial("decl"))){
            Utils.previousToken();
            parseDecl();
        }Utils.previousToken();
        parseStmt();
    }

    public static void parseStmt()throws CompileException {
        if (!MyBool.isReturn(Utils.nextTokenLexcial("return"))){
            throw new CompileException("Parser Error is not a Return ");
        }
        output.add("ret");

        int expNum = parseExp();
//        if(!MyBool.isNumber(Utils.getLexical("number"))){
//            throw new CompileException("Parser Error is not a Number ");
//        };
        output.add("i32 "+expNum);
        if(!MyBool.isSemicolon(Utils.nextTokenLexcial(";"))){
            throw new CompileException("Parser Error is not a ; ");
        }


    }
    public static int parseExp()throws CompileException {
//        System.out.println("get Exp");
        return parseAddExp();
    }
    public static int parseAddExp()throws CompileException {
        int mulExpNum = parseMulExp();

        while(MyBool.isUnaryOp(Utils.nextTokenLexcial("+ or -"))){
            String op = Utils.getPreviousToken().getValue();
            System.out.println("this op:"+op);
            if(op.equals("Plus")) {
                mulExpNum += parseMulExp();
            }else if (op.equals("Minus")) {
                mulExpNum -= parseMulExp();
            }else{
                throw new IllegalArgumentException("not - +");
            }
        }
        Utils.previousToken();
        return mulExpNum;
    }
    public static int parseMulExp()throws CompileException {
//        System.out.println("get UnaryExp");
        int unaryExpNum = parseUnaryExp();
        while(MyBool.isLevel3Operator(Utils.nextTokenLexcial("* / %"))){
            String op = Utils.getPreviousToken().getValue();
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
        Utils.previousToken();
        return unaryExpNum;
    }
    public static int parseUnaryExp()throws CompileException {

        int thisLexcial = Utils.nextTokenLexcial("( or Op");

        if(MyBool.isUnaryOp(thisLexcial)){
            int coefficient = 1;
            while(MyBool.isUnaryOp(thisLexcial)){
                coefficient *= parseUnaryOp(thisLexcial);
                thisLexcial = Utils.nextTokenLexcial("UnaryOp");
            }
            Utils.previousToken();
            return coefficient * parsePrimaryExp();
        }else{
            Utils.previousToken();
            return parsePrimaryExp();
        }
    }

    public static int parsePrimaryExp() throws CompileException {
        Token token = Utils.nextToken("( or Number in PrimaryExp");
        if( MyBool.isLParen(token.getLexcial())){

            int num = parseExp();
            if(!MyBool.isRParen(Utils.nextTokenLexcial(")"))){
                throw new CompileException("Parser Error is not )");
            }
            return num;
        }else if(MyBool.isNumber(token.getLexcial())){
            return Integer.parseInt(token.getValue());
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

    public static void deleteComment(ArrayList<Token> tokens)throws CompileException {
        int listSize = tokens.size();
        int i,j;
        for (i=0;i<tokens.size();i++){
            if(i<tokens.size() && MyBool.isLBlockComment(tokens.get(i).getLexcial())){
                while(i<tokens.size()-1 && ! MyBool.isRBlockComment(tokens.get(i).getLexcial())){
                    tokens.remove(i);
                }
                tokens.remove(i);
                i=i-1;
            }
        }
        for (i=0; i<tokens.size(); i++) {
            if (tokens.get(i).getLexcial()<0)
                throw new CompileException("Lexical Error The String is "+tokens.get(i).getValue());
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
    public static void lexicalAnalysis(String input) throws CompileException,FileNotFoundException{
        Lexical.makeTokenList(input);
    }
    public static void main(String[] args) throws CompileException,FileNotFoundException {
        lexicalAnalysis(args[0]);
        try {
            parseCompUnit();
        }catch (CompileException e){
//            System.out.println(e);
            e.printStackTrace();
            System.exit(-1);
        }
        for(String str : output){
            System.out.println(str);
        } outputFile(args[1],output );
        System.exit(0);
    }
}
