package frontend;

import Util.CompileException;
import Util.Utils;
import ir.Analysis;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Parser {
    public static ArrayList<String> midCodeOut = new ArrayList<String>();
    public Analysis ir = new Analysis();
    //    CompUnit     -> [CompUnit] (Decl | FuncDef)
    public static void parseCompUnit()throws CompileException {
        int lexcial = Token.getNextToken().getLexcial();
        while(Token.isCompUnit(lexcial)){
            if(Token.isFuncType(lexcial))  {if(!parseFuncDef()) {
                parseDecl();
            }
            }
            else if(Token.isDecl(lexcial)) {
                parseDecl();
            } else if(lexcial == -1){
                return;
            }else{
                throw new IllegalArgumentException("compunit error");
            }
            lexcial = Token.getNextToken().getLexcial();
        }
    }
    //    Decl         -> ConstDecl | VarDecl
    public static void parseDecl() throws CompileException {
        if(Token.isConstDec(Token.nextTokenLexcial("const"))){
            Token.previousToken();
            parseConstDecl();
        }else{
            Token.previousToken();
            parseVarDecl();
        }
    }
    //    ConstDecl    -> '' BType ConstDef { ',' ConstDef } ';'
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
    //    BType        -> 'int'
    public static void parseBType() throws CompileException { // 检测Bype 只有int
        Token.exceptNextToken(Lexical.INT_DEC);
    }
    //ConstDef     -> Ident { '[' ConstExp ']' } '=' ConstInitVal
    public static void parseConstDef() throws CompileException {

        Token identToken = Token.nextToken("ident");
        if(!Token.isIdent(identToken.getLexcial())){
            throw new CompileException("Parser const def Error is not Ident");
        }
        ArrayList<Integer> arrayDismension = new ArrayList<>();
        int atom = 0,length = 1; // 数组维度的最小值 ： a[3][4] 即atom = 4
        while(Token.nextTokenLexcial("[") == Lexical.LBRACKET){
            int constAddr = parseConstExp();
            atom = Utils.getSymbolItemByAddress(constAddr).getValueInt(); // update atom
            length *= atom;
            if(atom == 0){throw  new CompileException("array size == 0");}
            arrayDismension.add(atom);
            Token.exceptNextToken(Lexical.RBRACKET);// ]
        }Token.previousToken();

        Token.exceptNextToken(Lexical.ASSIGN);
        int valueConstInitvalAddress = parseConstInitVal(arrayDismension);
        SymbolItem constItem = Utils.getSymbolItemByAddress(valueConstInitvalAddress);
        if(constItem.kind == 0){
            throw new CompileException("const cant assign by var");
        }
        if(Utils.isGlobal()){
            Utils.allocateGlobalVariable(identToken,constItem.getValueInt(),atom==0?1:3,false,valueConstInitvalAddress);

        }else{
            if(atom ==0) // 非数组
                Utils.storeConstVariable(identToken.getValue(),constItem.getValueInt(), Utils.getNowFunction());
            else{
                Utils.storeArrayItem(identToken.getValue(),3,length,valueConstInitvalAddress,Utils.getNowFunction());
            }
        }
    }
    public static ArrayList<Integer> makeSatisfyList(ArrayList<Integer> list){
        int len = list.size();
        ArrayList<Integer> newList = (ArrayList<Integer> )list.clone();
        for(int i=len-2;i>=0;i--){
            newList.set(i,newList.get(i)*newList.get(i+1));
        }
        System.out.println("make satisfy list");
        for(int i:newList){
            System.out.printf("%d ",i);
        }
        System.out.println("end make ");
        return newList;
    }
    public static int parseArrayRead(ArrayList<Integer> dismension,int type) throws CompileException {
        ArrayList<Integer> list = new ArrayList<Integer>();
        ArrayList<Integer> satisfiedList = makeSatisfyList(dismension);
        int nowLevel =0;
        while(nowLevel>-1){
            Token token = Token.nextToken("const init");
            if(token.getLexcial() == Lexical.LBRACE) {
                nowLevel++;
                if(Token.getNextToken().getLexcial() == Lexical.RBRACE)
                    list.add(Utils.allocateConst(0));
                // bug const int c[4][2] = {{1}, {3},{},{1}}; 在{} 先填个零，剩下的下面会直接填上的
            }
            else if(token.getLexcial() == Lexical.RBRACE){
                for(int i=(list.size()-1)%satisfiedList.get(nowLevel);i<satisfiedList.get(nowLevel)-1;i++){
                    list.add(Utils.allocateConst(0));
                }
                nowLevel -- ;
            }else if(token.getLexcial() == Lexical.SEMICOLON){
                if(nowLevel>0){
                    throw new CompileException("array assign is not end!!");
                }
            }else if(token.getLexcial() == Lexical.COMMA){
                continue;
            }else {// 只剩下表达式了
                Token.previousToken();
                if(type == 1)
                    list.add(parseConstExp());
                else list.add(parseExp());
            }
        }
//            for(int i=0;i<list.size();i++){
//                System.out.printf("%d ",(Utils.getSymbolItemByAddress(list.get(i))).getValueInt());
//            }System.out.println();

        return Utils.makeConstArray(null,3,dismension,list);
    }
    // ConstInitVal -> ConstExp | '{' [ ConstInitVal { ',' ConstInitVal } ] '}'
    public static int parseConstInitVal(ArrayList<Integer> dismension) throws CompileException {
        if(Token.nextTokenLexcial("{") == Lexical.LBRACE){
           return parseArrayRead(dismension,1);
        }
        Token.previousToken();
        return parseConstExp();
    }
    // ConstExp     -> AddExp
    public static int parseConstExp() throws CompileException {
        int addExpAddr = parseAddExp();
        if(Utils.getSymbolItemByAddress(addExpAddr).isConstant() == false) {
            throw new CompileException("this const exp is not a const! ");
        }
        return addExpAddr;
    }
    // VarDecl      -> BType VarDef { ',' VarDef } ';'
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
    // VarDef   -> Ident { '[' ConstExp ']' }  | Ident { '[' ConstExp ']' } '=' InitVal
    public static void parseVarDef() throws CompileException {
        Token identToken = Token.nextToken("ident");
        int varAddr = 0;
        ArrayList<Integer> arrayDismension = new ArrayList<>();
        int atom = 0,length = 1; // 数组维度的最小值 ： a[3][4] 即atom = 4
        while(Token.nextTokenLexcial("[") == Lexical.LBRACKET){
            int constAddr = parseConstExp();
            atom = Utils.getSymbolItemByAddress(constAddr).getValueInt(); // update atom
            length *= atom;
            if(atom == 0){throw  new CompileException("array size == 0");}
            arrayDismension.add(atom);
            Token.exceptNextToken(Lexical.RBRACKET);// ]
        }Token.previousToken();
        if(!Token.isAssign(Token.nextTokenLexcial("="))){
            if(Utils.isGlobal()){
                Utils.allocateGlobalVariable(identToken,0,atom!=0?4:0,true,Utils.makeEmptyArray(arrayDismension));
            }else{
                    varAddr = Utils.allocateVariable(identToken,atom!=0?4:0, arrayDismension,Utils.getNowFunction());
            }
            Token.previousToken();
            return;
        }

        int valueAddr = parseInitVal(arrayDismension);
        if(Utils.isGlobal()) {
            if(Utils.getSymbolItemByAddress(valueAddr).isConstant() == false){
                throw  new CompileException("global assign is not a constant");
            }
            Utils.allocateGlobalVariable(identToken, Utils.getSymbolItemByAddress(valueAddr).getValueInt(),atom==0?0:4,false,valueAddr);
            return;
        }
        if(atom ==0){
            varAddr = Utils.allocateVariable(identToken,0,arrayDismension, Utils.getNowFunction());
            varAddr = Utils.storeVariable(identToken, Utils.getSymbolItemByAddress(valueAddr).getValueInt());
            midCodeOut.add(Utils.storeVariableOutput(valueAddr,varAddr));
        }else{
            Utils.storeArrayItem(identToken.getValue(),4,length,valueAddr,Utils.getNowFunction());
        }
        return;
    }
    public static int parseInitVal(ArrayList<Integer> dismension) throws CompileException {
        if(Token.nextTokenLexcial("{") == Lexical.LBRACE){
            return parseArrayRead(dismension,0);
        }Token.previousToken();
        return parseExp();
    }
    // FuncDef      -> FuncType Ident '(' [FuncFParams] ')' Block
    public static Boolean parseFuncDef()throws CompileException {
        Token funcDef = Token.nextToken("FuncDef");
        String funcName = parseIdent();
        // 如果下一个不是函数定义，则可能是变量定义，先回退
        if(Token.getNextToken().getLexcial() != Lexical.LPAREN) {
            Token.previousToken();
            Token.previousToken(); return false;
        }


        Token.exceptNextToken(Lexical.LPAREN);
        // TODO 函数参数
        Token.exceptNextToken(Lexical.RPAREN);
        midCodeOut.add("define dso_local i32"+funcName+"(){");
        Utils.enterFunction(funcName); // 进入函数
        parseBlock();

        midCodeOut.add("}");
        return true;
    }

    public static String parseIdent()throws CompileException {
        Token.exceptNextToken(Lexical.IDENT);
//        midCodeOut.add(Token.getPreviousToken().getValue());
        return Token.getPreviousToken().getValue(); // 获取标识符的名字
    }
    // Block        -> '{' { BlockItem } '}'
    public static int parseBlock()throws CompileException {
        Utils.enterBlock(); //blockindex ++;
        Token.exceptNextToken(Lexical.LBRACE);   //midCodeOut.add("{");
        int blockHasRet = 0;
        while (!Token.judgeNextToken(Lexical.RBRACE)) {
            Token.previousToken();
            blockHasRet += parseBlockItem();
        }
        Utils.quitBlock();
//        midCodeOut.add("}");
        return blockHasRet>0?1:0;
    }
    // BlockItem    -> Decl | Stmt
    public static int  parseBlockItem() throws CompileException {
        if(Token.isDecl(Token.nextTokenLexcial("decl"))){
            Token.previousToken();
            parseDecl();
            return 0;
        }else{
            Token.previousToken();
            return parseStmt();
        }
    }
    //Stmt         -> LVal '=' Exp ';'
    //                | [Exp] ';'
    //                | Block
    //                | 'if' '(' Cond ')' Stmt [ 'else' Stmt ]
    //                | 'while' '(' Cond ')' Stmt
    //                | 'break' ';'
    //                | 'continue' ';'
    //                | 'return' [Exp] ';'
    public static int parseStmt()throws CompileException {
        Token token = Token.nextToken("exp or Lval = Exp or return or block or if");
        if(token.judgeThis(Lexical.RETURN_DEC)){
            int expAddress = parseExp();
            SymbolItem retSymbolItem = Utils.getSymbolItemByAddress(expAddress);
//            System.out.println("ret exp address = "+expAddress);
            String retStr = (retSymbolItem.kind == 1)  ?  ""+retSymbolItem.getValueInt()    :    "%"+retSymbolItem.getAddress();
            midCodeOut.add("ret i32 "+retStr);
            Token.exceptNextToken(Lexical.SEMICOLON);
            return 1;
        }
        else if(Token.isIdent(token.getLexcial())){
            if(Token.isAssign(Token.getNextToken().getLexcial())){ // =
                Token.nextToken("=");
                //SymbolItem theSymbolItem = Utils.getSymbolItem(token,Utils.getNowFunction());
                int expAddr = parseExp();
                int varAddr = Utils.storeVariable(token, Utils.getSymbolItemByAddress(expAddr).getValueInt());
                midCodeOut.add(Utils.storeVariableOutput(expAddr,varAddr));
                Token.exceptNextToken(Lexical.SEMICOLON);
            }else if(Token.getNextToken().getLexcial() == Lexical.LBRACKET){
                SymbolItem array = Utils.getSymbolItem(token);
                ArrayList<Integer> getAddrList = new ArrayList<Integer>();
                while(Token.nextTokenLexcial("[") == Lexical.LBRACKET ){
                    getAddrList.add(parseExp());
                    Token.exceptNextToken(Lexical.RBRACKET);
                }Token.previousToken();
                int locationAddr = array.addrListTransLocation(getAddrList);

                if(Token.isAssign(Token.nextTokenLexcial("="))){//SymbolItem theSymbolItem = Utils.getSymbolItem(token,Utils.getNowFunction());
                    int expAddr = parseExp();
                    int varAddr = Utils.getArrayElemAddr(array.getAddress(),locationAddr);
                    array.arrayAddrList.set(Utils.getSymbolItemByAddress(locationAddr).getValueInt(),expAddr);
                    midCodeOut.add(Utils.storeVariableOutput(expAddr,varAddr));
                }
            }
            else {

                Token.previousToken();
                if(!Token.isSemicolon(Token.getNextToken().getLexcial())) {
                    parseExp();
                 }
                Token.exceptNextToken(Lexical.SEMICOLON);
            }
        }
        else if(token.getLexcial() == Lexical.IF_DEC){
            Token.exceptNextToken(Lexical.LPAREN);
            int condAddr = parseCond();
            System.out.println("condAddr !!!!!"+condAddr);
            SymbolItem thisAddrItem = Utils.getSymbolItemByAddress(condAddr);
            Utils.beforejudgeCondition(condAddr);
            Utils.readyJump();
            int endLoca =midCodeOut.size() - 1;
            Token.exceptNextToken(Lexical.RPAREN);
            Utils.nextLabel();
            int stmtRet = parseStmt();
            int jumpToloca1 =0;
            if(stmtRet == 1){
                int label = Utils.nextLabel();
            }Utils.endBlockJumpOutput(); // 如果stmt中没有ret continue break等结束块语句
            jumpToloca1 = midCodeOut.size() - 1;
//            midCodeOut.add("br label jumpToEndAddr");

            if(Token.getNextToken().getLexcial()==Lexical.ELSE_DEC ){
                Token.exceptNextToken(Lexical.ELSE_DEC);
                int elseAddr = Utils.nextLabel();
                 stmtRet = parseStmt();
                if(stmtRet == 1){
                    Utils.nextLabel();
                }
                    Utils.endBlockJumpOutput();
                int jumpToloca2 = midCodeOut.size() - 1;
                int outAddr = Utils.nextLabel();
                Analysis.replacePreciseStr(midCodeOut,jumpToloca1, Analysis.LEAVE_ADDRESS,"%"+outAddr);
                Analysis.replacePreciseStr(midCodeOut,jumpToloca2, Analysis.LEAVE_ADDRESS,"%"+outAddr);
                Analysis.replacePreciseStr(midCodeOut,endLoca, Analysis.BR_ADDRESS2,"%"+elseAddr);
            }
            
            else{
                int endAddr = Utils.nextLabel();
//                midCodeOut.add(endAddr+":");
                Analysis.replacePreciseStr(midCodeOut,jumpToloca1,Analysis.LEAVE_ADDRESS,"%"+endAddr);
                Analysis.replacePreciseStr(midCodeOut,endLoca, Analysis.BR_ADDRESS2,"%"+endAddr);
            }

            return 0;
        }
        else if(token.getLexcial() == Lexical.LBRACE){
            Token.previousToken();
//            int blockHasRet = parseBlock();
            return parseBlock();
        }
        else if(token.getLexcial() == Lexical.WHILE_DEC){
            Token.exceptNextToken(Lexical.LPAREN);
            Utils.endBlockJumpOutput();int beginCondLoca = midCodeOut.size()-1; int beginCondLabel = Utils.nextLabel();
            Analysis.replacePreciseStr(midCodeOut,beginCondLoca,Analysis.LEAVE_ADDRESS,"%"+beginCondLabel);
            int condAddr = parseCond();
            Token.exceptNextToken(Lexical.RPAREN);
            Utils.cycleStack.push(new ArrayList<HashMap<Integer, Integer>>());  //全局栈压栈
            Utils.beforejudgeCondition(condAddr);Utils.readyJump(); int jumpToloca2 = midCodeOut.size()-1; int condLabel = Utils.nextLabel();
            int stmtRet = parseStmt();
            if(stmtRet == 1){
                int label = Utils.nextLabel();
            }
            Utils.endBlockJumpOutput(); int endCycleLoca = midCodeOut.size() - 1;
            int endCycleLabel = Utils.nextLabel();
            Analysis.replacePreciseStr(midCodeOut,endCycleLoca,Analysis.LEAVE_ADDRESS,"%"+beginCondLabel);

            Analysis.replacePreciseStr(midCodeOut,jumpToloca2,Analysis.BR_ADDRESS2,"%"+endCycleLabel);

            List<HashMap<Integer, Integer>> list = Utils.cycleStack.pop();
            for (int i=0;i<list.size();i++){
                HashMap<Integer, Integer> map = list.get(i);
                if(map.containsKey(0)){
                    Analysis.replacePreciseStr(midCodeOut,map.get(0),Analysis.LEAVE_ADDRESS,"%"+beginCondLabel);
                }else if(map.containsKey(1)){
                    Analysis.replacePreciseStr(midCodeOut,map.get(1),Analysis.LEAVE_ADDRESS,"%"+endCycleLabel);
                }else{
                    throw new CompileException("not continue break!!!");
                }
            }
        }
        else if(token.getLexcial() == Lexical.CONTINUE_DEC){
            Token.exceptNextToken(Lexical.SEMICOLON);
            Utils.endBlockJumpOutput();
            int size = midCodeOut.size() - 1;
            Utils.cycleStack.peek().add(new HashMap<>(){{put(0,size);}});
            return 1;
        }
        else if(token.getLexcial() == Lexical.BREAK_DEC){
            Token.exceptNextToken(Lexical.SEMICOLON);
            Utils.endBlockJumpOutput();
            int size = midCodeOut.size() - 1;
            Utils.cycleStack.peek().add((new HashMap<>(){{put(1,size);}}));
            return 1;
        }
        else if(token.getLexcial() == Lexical.SEMICOLON){
            return 0;
        }
        else{
            throw new CompileException("stmt error");
//            Token.previousToken();
        }
        return 0;
    }
    // Exp          -> AddExp
    public static int parseExp()throws CompileException {
        return parseAddExp();
    }
    // Cond         -> LOrExp
    public static int parseCond() throws CompileException {
        int lorAddr = parseLorExp();
//        Utils.getSymbolItemByAddress(lorAddr).isCond = true; // 设置cond返回的item一定是一个条件变量，  覆盖if(1+1) 类型
        return lorAddr;
    }
    // AddExp       -> MulExp  | AddExp ('+' | '−') MulExp
    public static int parseAddExp()throws CompileException {
        int addExpAddress = parseMulExp();
        //todo 可以简化步骤
        while(Token.isUnaryOp(Token.nextTokenLexcial("+ or -"))){
            String op = Token.getPreviousToken().getValue();
//            System.out.println("this op:"+op);
            int mulExpAddress = parseMulExp();
            if("add".equals(op) || "sub".equals(op)) {
                addExpAddress = Utils.midExpCalculate(op,addExpAddress,mulExpAddress);
            }else{
                throw new IllegalArgumentException("not - +");
            }
        }
        Token.previousToken();
        return addExpAddress;
    }
    // MulExp       -> UnaryExp  | MulExp ('*' | '/' | '%') UnaryExp
    public static int parseMulExp()throws CompileException {
        int mulExpAddress = parseUnaryExp();
        while(Token.isLevel3Operator(Token.nextTokenLexcial("* / %"))){
            String op = Token.getPreviousToken().getValue();
            int unaryExpAddress = parseUnaryExp();
            if("mul".equals(op) || "sdiv".equals(op)|| "srem".equals(op)) {
                mulExpAddress = Utils.midExpCalculate(op,mulExpAddress,unaryExpAddress);
            }else{
                throw new IllegalArgumentException("not * / %");
            }
        }
        Token.previousToken();
        return mulExpAddress;
    }
    // UnaryExp     -> PrimaryExp  | Ident '(' [FuncRParams] | UnaryOp UnaryExp
    public static int parseUnaryExp()throws CompileException {
        Token thisToken = Token.nextToken("( or Op or func(param)");
        int thisLexcial = thisToken.getLexcial(),notCount = 0;

        if(Token.isUnaryOp(thisLexcial)){
            int coefficient = 1;
            while(Token.isUnaryOp(thisLexcial)){
                if(thisLexcial == Lexical.AND || thisLexcial== Lexical.MINUS)
                    coefficient *= parseUnaryOp(thisLexcial);
                else if(thisLexcial == Lexical.NOT){
                    notCount ++;
                }
                thisLexcial = Token.nextTokenLexcial("UnaryOp");
            }
            Token.previousToken();
            int primaryAddr = parsePrimaryExp();
            if(Utils.getSymbolItemByAddress(primaryAddr).isConstant())
                primaryAddr = Utils.storeConstVariable(null,coefficient* Utils.getSymbolItemByAddress(primaryAddr).getValueInt(),Utils.getNowFunction());

//            else
//                primaryAddr = Utils.putNewSymbol(new SymbolItem(null,0,coefficient* Utils.getSymbolItemByAddress(primaryAddr).getValueInt()));
//                    Utils.storeVariable(null,);
            else if(coefficient == -1){
                int newNegativeOne = Utils.storeConstVariable(null,-1,Utils.getNowFunction());
                primaryAddr = Utils.midExpCalculate("mul",primaryAddr,newNegativeOne);
                Utils.putAddressSymbol(primaryAddr,new SymbolItem(null,0,-Utils.getSymbolItemByAddress(primaryAddr).getValueInt(),Utils.getBlockIndex()));
            }
            if(notCount%2==1){
//                primaryAddr = Utils.putNewVariable(null,1-Utils.getSymbolItemByAddress(primaryAddr).getValueInt(), Utils.getNowFunction());
                int newZeroAddr = Utils.storeConstVariable(null,0,Utils.getNowFunction());
                primaryAddr = Utils.midExpCalculate("eq",(Utils.getNowAddress()-1),newZeroAddr);
                Utils.putAddressSymbol(primaryAddr,new SymbolItem(null,0,1-Utils.getSymbolItemByAddress(primaryAddr).getValueInt(),true));
//                midCodeOut.add("%"+Utils.getNowAddress()+" = icmp eq i32 %"++", 0");
            }
            return primaryAddr;
        }else if(Token.isIdent(thisLexcial)&& Token.isLParen(Token.getNextToken().getLexcial())){
            // TODO ! 还没兼容函数
            if(!Utils.funcSymbolTable.containsKey(thisToken.getValue())) {
                throw new CompileException("Parse dont hava this func "+thisToken.getValue());
            }
            SymbolItem funcItem = Utils.funcSymbolTable.get(thisToken.getValue());
            Token.nextToken("(");
            ArrayList<Integer> paramAddrList = new ArrayList<>();
            int i;
            for(i=0;i< funcItem.length;){

                paramAddrList.add(Utils.loadPointer(parseExp()));
                i++;
                if(!Token.isComma(Token.nextTokenLexcial(","))){
                    Token.previousToken();
                    break;
                }
            }if(i< funcItem.length){
                throw new CompileException("Parse Error ident param is lack");
            }
            Token.exceptNextToken(Lexical.RPAREN);
            return processIOFunc(thisToken.getValue(),paramAddrList);
        }

        else{
            Token.previousToken();
            return parsePrimaryExp();
        }
    }
    // PrimaryExp   -> '(' Exp ')' | LVal | Number
    public static int parsePrimaryExp() throws CompileException {
        Token token = Token.nextToken("( ,LVal or Number in PrimaryExp");
        if( Token.isLParen(token.getLexcial())){
            int address = parseExp();
            Token.exceptNextToken(Lexical.RPAREN);
            return address;
        }else if(Token.isNumber(token.getLexcial())){
            int value = Integer.parseInt(token.getValue());
            return Utils.storeConstVariable(null,value, Utils.getNowFunction());
        }else if(Token.isIdent(token.getLexcial())){
            if(Token.getNextToken().getLexcial() != Lexical.LBRACKET){
                SymbolItem lval = Utils.getSymbolItem(token);

                if(lval.kind != 1) {
                    midCodeOut.add(Utils.loadLValOutput(token, Utils.getNowFunction()));
                }
                return lval.getLoadAddress();
            }else{
                SymbolItem array = Utils.getSymbolItem(token);
                ArrayList<Integer> getAddrList = new ArrayList<Integer>();
                while(Token.nextTokenLexcial("[") == Lexical.LBRACKET ){
                    getAddrList.add(parseExp());
                    Token.exceptNextToken(Lexical.RBRACKET);
                }Token.previousToken();
                int locationAddr = array.addrListTransLocation((getAddrList));
                return Utils.getArrayElemAddr(array.getAddress(),locationAddr);
            }

//            return Utils.getIdentLVal(token,Utils.getNowFunction());
        }
        else{
            throw new CompileException("Parser Error "+token.getValue()+" is not ( or Number in PrimaryExp");
        }

    }
    // Plus return + Minux return false
    public static int parseUnaryOp(int morpheme)throws CompileException {
        int op = morpheme;
        if(!(Token.isPlus(op) || Token.isMinus(op) ||op == Lexical.NOT)){
            throw new CompileException("Unary op is not + or -");
        }
        switch(op){
            case Lexical.PLUS -> {
                return 1;
            }
            case Lexical.MINUS ->{
                return -1;
            } case Lexical.NOT ->{

                return 1;
            }default -> {
                throw new CompileException("not + - !");
            }
        }
//        return Token.isPlus(op)?1:-1;
    }
    public static int parseLorExp() throws CompileException {
        int lorAddr = parseLAndExp();
        while(Token.getNextToken().getLexcial() == Lexical.OR){
            String orOp = Token.nextToken("||").getValue();
            int landAddr = parseLAndExp();
            lorAddr = Utils.midExpCalculate(orOp,lorAddr,landAddr);
        }
        return lorAddr;
    }
    public static int parseLAndExp () throws CompileException {
        int landAddr = parseEqExp();
        while(Token.getNextToken().getLexcial() == Lexical.AND){
            String  andOp = Token.nextToken("&&").getValue();
            int eqAddr = parseEqExp();
            landAddr = Utils.midExpCalculate(andOp,landAddr,eqAddr);
        }
        return landAddr;
    }
    public static int parseEqExp () throws CompileException {
        int eqAddr = parseRelRExp();

        while(Token.getNextToken().getLexcial() == Lexical.EQUALS ||Token.getNextToken().getLexcial() == Lexical.NEQUALS){
            String eqOp = Token.nextToken("== or != ").getValue();
            int relAddr = parseRelRExp();
            eqAddr = Utils.midExpCalculate(eqOp,eqAddr,relAddr);
        }
        return eqAddr;
    }
    public static int parseRelRExp() throws CompileException {
        int relAddr = parseAddExp();
        while(Token.isRelOp(Token.getNextToken().getLexcial())){
            String relOp = Token.nextToken("< > <= >= ").getValue();
            // TOOD 计算
            int addAddr = parseAddExp();
            relAddr = Utils.midExpCalculate(relOp,relAddr,addAddr);
        }
        return relAddr;
    }



    public static int processIOFunc(String funcName,ArrayList<Integer> paramAddrList) throws CompileException {
        int retAddr = 0;
//        System.out.println("funcname"+funcName);
        if("@getint".equals(funcName)){
            int intValue = 1;
//            intValue = Utils.scanner.nextInt();
            int saveAddress = Utils.callFunction(funcName,paramAddrList);
//            System.out.println("saveaddress"+saveAddress);
            SymbolItem saveItem = new SymbolItem(null,0,intValue,Utils.getBlockIndex());  saveItem.setAddress(saveAddress);
            Utils.addressSymbolTable.put(saveAddress,saveItem);
            return saveAddress;
        }else if("@getch".equals(funcName)){
            int intValue = 1;

            int saveAddress = Utils.callFunction(funcName,paramAddrList);
//            System.out.println("saveaddress"+saveAddress);
            SymbolItem saveItem = new SymbolItem(null,0,intValue,Utils.getBlockIndex());  saveItem.setAddress(saveAddress);
            Utils.addressSymbolTable.put(saveAddress,saveItem);
            return saveAddress;
        }else if("@putint".equals(funcName)){
            int saveAddress = Utils.callFunction(funcName,paramAddrList);
            int address = paramAddrList.get(0);
            System.out.println("putint:"+ Utils.getSymbolItemByAddress(address).getValueInt());
            return saveAddress;
        }else if("@putch".equals(funcName)){
            int saveAddress = Utils.callFunction(funcName,paramAddrList);
            int address = paramAddrList.get(0);
            System.out.println("putch:"+((char) Utils.getSymbolItemByAddress(address).getValueInt()));
            return saveAddress;
        }else{
            throw new CompileException("IOFunction error");
        }
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
        for (i=0; i<tokens.size(); i++) {// 词法分析异常
            if (tokens.get(i).getLexcial()<0) {
                throw new CompileException("Lexical Error The String is "+tokens.get(i).getValue());
            }
        }
    }
    public static void outputFile(String file,ArrayList<String> array)  {

        BufferedWriter out = null;
        try {
            out = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream(file, false)));
//            out.write(conent+"\r\n");
            for(int i=0;i<array.size();i++){
                out.write(array.get(i)+"\r\n");
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
        Utils.initIOFunctions();
        lexicalAnalysis(args[0]);
        try {
            parseCompUnit();
        }catch (CompileException e){
//            System.out.println(e);
            e.printStackTrace();
            for(String str : midCodeOut){
                System.out.println(str);
            }

            System.exit(-1);
        }
        for(String str : midCodeOut){
            System.out.println(str);
        } outputFile(args[1],midCodeOut );
        System.exit(0);
    }
}
