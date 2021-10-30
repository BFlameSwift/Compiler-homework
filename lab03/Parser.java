package lab03;

import java.io.*;
import java.util.ArrayList;

public class Parser {
    public static ArrayList<String> output = new ArrayList<String>();
    public static void initIOFunctions() {
        output.add("declare i32 @getint()");
        output.add("declare i32 @getch()");
        output.add("declare void @putint(i32)");
        output.add("declare void @putch(i32)");
        SymbolItem getint = new SymbolItem("@getint",2,0,1,0);
        SymbolItem getch = new SymbolItem("@getch",2,0,1,0);
        SymbolItem putint = new SymbolItem("@putint",2,0,0,1);
        SymbolItem putch = new SymbolItem("@putch",2,0,0,1);
        Utils.allFuncList.add("@getint");Utils.allFuncList.add("@putint");Utils.allFuncList.add("@getch");Utils.allFuncList.add("@putch");
        Utils.funcSymbolTable.put("@getint",getint); Utils.funcSymbolTable.put("@putint",putint); Utils.funcSymbolTable.put("@getch",getch);Utils.funcSymbolTable.put("@putch",putch);
    }

    public static void parseCompUnit()throws CompileException {
        parseFuncDef();
    }
    public static void parseDecl() throws CompileException {
        if(Token.isConstDec(Token.nextTokenLexcial("const"))){
            Token.previousToken();
            parseConstDecl();
        }else{
            Token.previousToken();
            parseVarDecl();
        }
    }
    public static void parseConstDecl() throws CompileException {
        Token.exceptNextToken(Lexical.CONST_DEC);

        parseBType();
        parseConstDef();
        while(Token.isComma(Token.nextTokenLexcial(","))){
            parseConstDef();
        }
        Token.previousToken();

        Token.exceptNextToken(Lexical.SEMICOLON);

    }
    public static void parseBType() throws CompileException { // 检测Bype 只有int
        Token.exceptNextToken(Lexical.INT_DEC);

    }
    public static void parseConstDef() throws CompileException {
        //TODO 添加进符号表
        Token identToken = Token.nextToken("ident");
        if(!Token.isIdent(identToken.getLexcial())){
            throw new CompileException("Parser const def Error is not Ident");
        }
        Token.exceptNextToken(Lexical.ASSIGN);

        int valueConstInitvalAddress = parseConstInitVal();
        SymbolItem constItem = Utils.getSymbolItemByAddress(valueConstInitvalAddress);
        if(constItem.kind == 0){
            throw new CompileException("const cant assign by var");
        }

        Utils.storeConstVariable(identToken.getValue(),constItem.valueInt,"main");

    }
    public static int parseConstInitVal() throws CompileException{
        return parseExp();
    }

    public static int parseConstExp() throws CompileException {
        return parseAddExp();
    }
    public static void parseVarDecl() throws CompileException {
//        System.out.println("in var decl");
        parseBType();
        parseVarDef();
        while((Token.isComma(Token.nextTokenLexcial(",")))){
            parseVarDef();
        }
        Token.previousToken();

        if(!Token.isSemicolon(Token.nextTokenLexcial(";"))){
            throw new CompileException("Parser error except ;");
        }
    }
    public static void parseVarDef() throws CompileException {
        Token identToken = Token.nextToken("ident");
        int varAddr = Utils.allocateVariable(identToken,0,false);
        output.add("%"+varAddr+" = alloca i32");
        if(!Token.isAssign(Token.nextTokenLexcial("="))){
            Token.previousToken();
            return;
        }
        int valueAddr = parseInitVal();
        varAddr = Utils.storeVariable(identToken,Utils.getSymbolItemByAddress(valueAddr).valueInt);
//        System.out.println(value);
        output.add(Utils.storeVariableOutput(valueAddr,varAddr));
        // TODO 变量赋值
        return;
    }
    public static int parseInitVal() throws CompileException {

        return parseExp();
        // TODO 修改EXP
    }


    public static void parseFuncDef()throws CompileException {
//        if (! MyBool.isFuncType(lexicalIterator.next())){
//            throw new CompileException("Parser Error is not a FuncType");
//        }
        Token.nextToken("FuncDef");
        output.add("define dso_local i32");
        parseIdent();

        Token.exceptNextToken(Lexical.LPAREN);  Token.exceptNextToken(Lexical.RPAREN);
        output.add("()");

        parseBlock();
        //TOOD
    }
    public static void parseIdent()throws CompileException {

        Token.exceptNextToken(Lexical.IDENT);
        output.add(Token.getPreviousToken().getValue());
    }
    public static void parseBlock()throws CompileException {
        Utils.enterBlock(); //blockindex ++;


        Token.exceptNextToken(Lexical.LBRACE);
        output.add("{");

        while (!Token.judgeNextToken(Lexical.RBRACE)) {
            Token.previousToken();
            parseBlockItem();
        }
//        Token.previousToken(); //上次判断
//        Token.exceptNextToken(Lexical.RBRACE);
        output.add("}");
    }
    public static void parseBlockItem() throws CompileException {

        if(Token.isDecl(Token.nextTokenLexcial("decl"))){
            Token.previousToken();
            parseDecl();
        }else{
            Token.previousToken();
            parseStmt();
        }
    }

    public static void parseStmt()throws CompileException {
        Token token = Token.nextToken("exp or Lval = Exp or return ");
        if(token.judgeThis(Lexical.RETURN_DEC)){
            int expAddress = parseExp();
            SymbolItem retSymbolItem = Utils.getSymbolItemByAddress(expAddress);
//            System.out.println("ret exp address = "+expAddress);
            String retStr = (retSymbolItem.kind == 1)  ?  ""+retSymbolItem.valueInt    :    "%"+retSymbolItem.getAddress();
            output.add("ret i32 "+retStr);

            Token.exceptNextToken(Lexical.SEMICOLON);
        }

        else if(Token.isIdent(token.getLexcial())){
            //TODO 如果找不到这个变量
           if(Token.isAssign(Token.nextTokenLexcial("="))){
//               SymbolItem theSymbolItem = Utils.getSymbolItem(token,"main");
               int expAddr = parseExp();
               int varAddr = Utils.storeVariable(token,Utils.getSymbolItemByAddress(expAddr).valueInt);
               output.add(Utils.storeVariableOutput(expAddr,varAddr));
               Token.exceptNextToken(Lexical.SEMICOLON);

           }else {
               Token.previousToken();Token.previousToken();
               if(!Token.isSemicolon(Token.getNextToken().getLexcial()))
                    parseExp();
               Token.exceptNextToken(Lexical.SEMICOLON);
//               Token expToken = Token.nextToken(";");
//               if(MyBool.isSemicolon(expToken.getLexcial())){
//                   return;
//               }
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
        while(Token.isUnaryOp(Token.nextTokenLexcial("+ or -"))){
            String op = Token.getPreviousToken().getValue();
//            System.out.println("this op:"+op);
            int mulExpAddress = parseMulExp();
            if(op.equals("add") || op.equals("sub")) {
                addExpAddress = Utils.midExpCalculate(op,addExpAddress,mulExpAddress);
            }else{
                throw new IllegalArgumentException("not - +");
            }
        }
        Token.previousToken();
        return addExpAddress;
    }
    public static int parseMulExp()throws CompileException {
        int mulExpAddress = parseUnaryExp();
        while(Token.isLevel3Operator(Token.nextTokenLexcial("* / %"))){
            String op = Token.getPreviousToken().getValue();
            int unaryExpAddress = parseUnaryExp();
            if(op.equals("mul") || op.equals("sdiv")|| op.equals("srem")) {
                mulExpAddress = Utils.midExpCalculate(op,mulExpAddress,unaryExpAddress);
            }else{
                throw new IllegalArgumentException("not * / %");
            }
        }
        Token.previousToken();
        return mulExpAddress;
    }
    public static int parseUnaryExp()throws CompileException {
        Token thisToken = Token.nextToken("( or Op or func(param)");
        int thisLexcial = thisToken.getLexcial();

        if(Token.isUnaryOp(thisLexcial)){
            int coefficient = 1;
            while(Token.isUnaryOp(thisLexcial)){
                coefficient *= parseUnaryOp(thisLexcial);
                thisLexcial = Token.nextTokenLexcial("UnaryOp");
            }
            Token.previousToken();

            return Utils.storeConstVariable(null,coefficient*Utils.getSymbolItemByAddress(parsePrimaryExp()).valueInt,"main");
//            return coefficient * parsePrimaryExp();
        }else if(Token.isIdent(thisLexcial)&& Token.isLParen(Token.getNextToken().getLexcial())){
//            System.out.println("funcname"+thisToken.getValue());
            if(!Utils.funcSymbolTable.containsKey(thisToken.getValue()))
                throw new CompileException("Parse dont hava this func "+thisToken.getValue());
            SymbolItem funcItem = Utils.funcSymbolTable.get(thisToken.getValue());
            Token.nextToken("(");
            ArrayList<Integer> paramAddrList = new ArrayList<>();
            int i;
            for(i=0;i< funcItem.length;){
                paramAddrList.add(parseExp());
                i++;
                if(!Token.isComma(Token.nextTokenLexcial(","))){
                    Token.previousToken();
                    break;
                }
            }if(i< funcItem.length){
                throw new CompileException("Parse Error ident param is lack");
            }

            if(!Token.isRParen(Token.nextTokenLexcial(")"))){
                throw new CompileException("Parser Error is not )");
            }
            return processIOFunc(thisToken.getValue(),paramAddrList);
        }

        else{
            Token.previousToken();
            return parsePrimaryExp();
        }
    }

    public static int processIOFunc(String funcName,ArrayList<Integer> paramAddrList) throws CompileException {
        int retAddr = 0;
//        System.out.println("funcname"+funcName);
        if(funcName.equals("@getint")){
            int intValue = 1;
//            intValue = Utils.scanner.nextInt();
            int saveAddress = Utils.callFunction(funcName,paramAddrList);
//            System.out.println("saveaddress"+saveAddress);
            SymbolItem saveItem = new SymbolItem(null,0,intValue);  saveItem.setAddress(saveAddress);
            Utils.addressSymbolTable.put(saveAddress,saveItem);
            return saveAddress;
        }else if(funcName.equals("@getch")){
            int intValue = 1;
//            intValue = Utils.scanner.nextInt();

            int saveAddress = Utils.callFunction(funcName,paramAddrList);
//            System.out.println("saveaddress"+saveAddress);
            SymbolItem saveItem = new SymbolItem(null,0,intValue);  saveItem.setAddress(saveAddress);
            Utils.addressSymbolTable.put(saveAddress,saveItem);
            return saveAddress;
        }else if(funcName.equals("@putint")){
            int saveAddress = Utils.callFunction(funcName,paramAddrList);
            int address = paramAddrList.get(0);
            System.out.println("putint:"+Utils.getSymbolItemByAddress(address).valueInt);
            return saveAddress;
        }else if(funcName.equals("@putch")){
            int saveAddress = Utils.callFunction(funcName,paramAddrList);
            int address = paramAddrList.get(0);
            System.out.println("putch:"+((char)Utils.getSymbolItemByAddress(address).valueInt));
            return saveAddress;
        }else{
            throw new CompileException("IOFunction error");
        }

    }


    public static int parsePrimaryExp() throws CompileException {
        Token token = Token.nextToken("( ,LVal or Number in PrimaryExp");
        if( Token.isLParen(token.getLexcial())){

            int address = parseExp();
            Token.exceptNextToken(Lexical.RPAREN);

            return address;
        }else if(Token.isNumber(token.getLexcial())){
            int value = Integer.parseInt(token.getValue());
            return Utils.storeConstVariable(null,value,"main");
        }else if(Token.isIdent(token.getLexcial())){
            SymbolItem lval = Utils.getSymbolItem(token,"main");
            if(!lval.isConstant())
                output.add(Utils.loadLValOutput(token,"main"));
//            output.add(Utils.loadLValOutput(token,"main"));
            return lval.getLoadAddress();
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

        if(!(Token.isPlus(op) || Token.isMinus(op))){
            throw new CompileException("Unary op is not + or -");
        }
        return Token.isPlus(op)?1:-1;
    }

    public static void deleteComment(ArrayList<Token> tokens)throws CompileException {
        int i;
        for (i=0;i<tokens.size();i++){
            if(i<tokens.size() && Token.isLBlockComment(tokens.get(i).getLexcial())){
                while(i<tokens.size()-1 && ! Token.isRBlockComment(tokens.get(i).getLexcial())){
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
                    new FileOutputStream(file, false)));
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
        initIOFunctions();
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
