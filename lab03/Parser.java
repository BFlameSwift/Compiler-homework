package lab03;

import java.io.*;
import java.util.ArrayList;

public class Parser {
    public static ArrayList<String> output = new ArrayList<String>();
    public static void parseCompUnit()throws CompileException {
        parseFuncDef();
    }
    public static void parseDecl() throws CompileException {
        if(MyBool.isConstDec(Token.nextTokenLexcial("const"))){
            Token.previousToken();
            parseConstDecl();
        }else{
            Token.previousToken();
            parseVarDecl();
        }
    }
    public static void parseConstDecl() throws CompileException {
        if(!MyBool.isConstDec(Token.nextTokenLexcial("const"))){
            throw new CompileException("Parser constdecl Error is not const");
        }
        parseBType();
        parseConstDef();
        while(MyBool.isComma(Token.nextTokenLexcial(","))){
            parseConstDef();
        }
        Token.previousToken();
        while(!MyBool.isSemicolon(Token.nextTokenLexcial(";"))){
            throw new CompileException("Parser constdecl Error is not ;");
        }
    }
    public static void parseBType() throws CompileException { // 检测Bype 只有int
        if(!MyBool.isIntDec(Token.nextTokenLexcial("int"))){
            throw new CompileException("Parser Error is not int");
        }
    }
    public static void parseConstDef() throws CompileException {
        //TODO 添加进符号表
        Token identToken = Token.nextToken("ident");
        if(!MyBool.isIdent(identToken.getLexcial())){
            throw new CompileException("Parser const def Error is not Ident");
        }if(!MyBool.isAssign(Token.nextTokenLexcial("="))){
            throw new CompileException("Parser const def Error is not =");
        }

        int valueConstInitval = parseConstInitVal();

        Utils.storeConstVariable(identToken.getValue(),valueConstInitval,"main");

    }
    public static int parseConstInitVal() throws CompileException{
        return Utils.getSymbolItemByAddress(parseConstExp()).valueInt;
    }

    public static int parseConstExp() throws CompileException {
        return parseAddExp();
    }
    public static void parseVarDecl() throws CompileException {
//        System.out.println("in var decl");
        parseBType();
        parseVarDef();
        while((MyBool.isComma(Token.nextTokenLexcial(",")))){
            parseVarDef();
        }
        Token.previousToken();

        if(!MyBool.isSemicolon(Token.nextTokenLexcial(";"))){
            throw new CompileException("Parser error except ;");
        }
    }
    public static void parseVarDef() throws CompileException {
        Token identToken = Token.nextToken("ident");
        int varAddr = Utils.allocateVariable(identToken,0,false);
        output.add("%"+varAddr+" = alloca i32");
        if(!MyBool.isAssign(Token.nextTokenLexcial("="))){
            Token.previousToken();
            return;
        }
        int value = parseInitVal();
        varAddr = Utils.storeVariable(identToken,value);
//        System.out.println(value);
        output.add(Utils.storeVariableOutput(varAddr));
        // TODO 变量赋值
        return;
    }
    public static int parseInitVal() throws CompileException {

        return Utils.getSymbolItemByAddress(parseExp()).valueInt;
        // TODO 修改EXP
    }


    public static void parseFuncDef()throws CompileException {
//        if (! MyBool.isFuncType(lexicalIterator.next())){
//            throw new CompileException("Parser Error is not a FuncType");
//        }
        Token.nextToken("FuncDef");
        output.add("define dso_local i32");

        parseIdent();

        if(!MyBool.isLParen(Token.nextToken("(").getLexcial()) || !MyBool.isRParen(Token.nextToken(")").getLexcial())){
            throw new CompileException("Parser Error is not ()");
        }
        output.add("()");

        parseBlock();
        //TOOD
    }
    public static void parseIdent()throws CompileException {

        if (! MyBool.isIdent(Token.nextToken("Ident").getLexcial())){
            throw new CompileException("Parser Error is not a Ident");
        }
        output.add(Token.getPreviousToken().getValue());

    }
    public static void parseBlock()throws CompileException {
        Utils.enterBlock(); //blockindex ++;

        if(!MyBool.isLBrace(Token.nextTokenLexcial("{"))){
            throw new CompileException("Parser Error is not a { ");
        } output.add("{");

        while (!MyBool.isRBrace(Token.nextTokenLexcial("}"))) {
            Token.previousToken();
            parseBlockItem();
        }
        Token.previousToken();
//        parseStmt();

        if(!MyBool.isRBrace(Token.nextTokenLexcial("}"))){
            throw new CompileException("Parser Error is not a } ");
        } output.add("}");
    }
    public static void parseBlockItem() throws CompileException {

        if(MyBool.isDecl(Token.nextTokenLexcial("decl"))){
            Token.previousToken();
            parseDecl();
        }else{
            Token.previousToken();
            parseStmt();
        }
    }

    public static void parseStmt()throws CompileException {
        Token token = Token.nextToken("exp or Lval = Exp or return ");
        if(MyBool.isReturn(token.getLexcial())){
            //        output.add("ret");
//            if(MyBool.isNumber(Token.nextTokenLexcial("number "))){
//                if(MyBool.isSemicolon(Token.nextTokenLexcial(";")) ){
//                    output.add("ret i32 "+ Token.previousToken().getValue());
//                    return;
//                }
//                Token.previousToken();
//            }
//            Token.previousToken();
//
//            int expNum = parseExp();
//        if(!MyBool.isNumber(Utils.getLexical("number"))){
//            throw new CompileException("Parser Error is not a Number ");
//        };
//        output.add("ret i32 "+expNum);
            int expAddress = parseExp();
            SymbolItem retSymbolItem = Utils.getSymbolItemByAddress(expAddress);
            System.out.println("ret exp address = "+expAddress);
            String retStr = (retSymbolItem.kind == 1)  ?  ""+retSymbolItem.valueInt    :    "%"+retSymbolItem.getAddress();
            output.add("ret i32 "+retStr);

            if(!MyBool.isSemicolon(Token.nextTokenLexcial(";"))){
                throw new CompileException("Parser Error is not a ; ");
            }
        }

        else if(MyBool.isIdent(token.getLexcial())){
            //TODO 如果找不到这个变量
           if(MyBool.isAssign(Token.nextTokenLexcial("="))){
//               SymbolItem theSymbolItem = Utils.getSymbolItem(token,"main");
               int expAddr = parseExp();
               int varAddr = Utils.storeVariable(token,Utils.getSymbolItemByAddress(expAddr).valueInt);
               output.add(Utils.storeVariableOutput(varAddr));
               if(!MyBool.isSemicolon(Token.nextTokenLexcial(";"))){
                   throw new CompileException("Parser Error is not a ; ");
               }
           }else {
               Token.previousToken();
               //TODO 处理表达式；
           }
        }else{
            Token.previousToken();
        }


    }
    public static int parseExp()throws CompileException {
//        System.out.println("get Exp");
        return parseAddExp();
    }
    public static int parseAddExp()throws CompileException {
        int addExpAddress = parseMulExp();
        //todo 可以简化步骤
        while(MyBool.isUnaryOp(Token.nextTokenLexcial("+ or -"))){
            String op = Token.getPreviousToken().getValue();
//            System.out.println("this op:"+op);
            int mulExpAddress = parseMulExp();
            if(op.equals("Plus")) {
                return Utils.midExpCalculate("add",addExpAddress,mulExpAddress);

            }else if (op.equals("Minus")) {
                Utils.midExpCalculate("sub",addExpAddress,mulExpAddress);
            }else{
                throw new IllegalArgumentException("not - +");
            }
        }
        Token.previousToken();
        return addExpAddress;
    }
    public static int parseMulExp()throws CompileException {
        int mulExpAddress = parseUnaryExp();
        while(MyBool.isLevel3Operator(Token.nextTokenLexcial("* / %"))){
            String op = Token.getPreviousToken().getValue();
            int unaryExpAddress = parseUnaryExp();
            if(op.equals("Mul")) {

                return Utils.midExpCalculate("mul",mulExpAddress,unaryExpAddress);
            }else if(op.equals("Div")) {
                return Utils.midExpCalculate("sdiv",mulExpAddress,unaryExpAddress);
            }else if(op.equals("Mod")){
                return Utils.midExpCalculate("smod",mulExpAddress,unaryExpAddress);

            }else{
                throw new IllegalArgumentException("not * / %");
            }
        }
        Token.previousToken();
        return mulExpAddress;
    }
    public static int parseUnaryExp()throws CompileException {

        int thisLexcial = Token.nextTokenLexcial("( or Op");

        if(MyBool.isUnaryOp(thisLexcial)){
            int coefficient = 1;
            while(MyBool.isUnaryOp(thisLexcial)){
                coefficient *= parseUnaryOp(thisLexcial);
                thisLexcial = Token.nextTokenLexcial("UnaryOp");
            }
            Token.previousToken();

            return Utils.storeConstVariable(null,coefficient*Utils.getSymbolItemByAddress(parsePrimaryExp()).valueInt,"main");
//            return coefficient * parsePrimaryExp();
        }else{
            Token.previousToken();
            return parsePrimaryExp();
        }
    }

    public static int parsePrimaryExp() throws CompileException {
        Token token = Token.nextToken("( ,LVal or Number in PrimaryExp");
        if( MyBool.isLParen(token.getLexcial())){

            int address = parseExp();
            if(!MyBool.isRParen(Token.nextTokenLexcial(")"))){
                throw new CompileException("Parser Error is not )");
            }
            return address;
        }else if(MyBool.isNumber(token.getLexcial())){
            int value = Integer.parseInt(token.getValue());
            return Utils.storeConstVariable(null,value,"main");
        }else if(MyBool.isIdent(token.getLexcial())){
            SymbolItem lval = Utils.getSymbolItem(token,"main");
            if(!lval.isConstant())
                output.add(Utils.loadLValOutput(token,"main"));
            return lval.getAddress();
//            return Utils.getIdentLVal(token,"main");
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
        int i;
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
